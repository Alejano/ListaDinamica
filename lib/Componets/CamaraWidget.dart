import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:listadinamica/Componets/CheckboxWidgetBuilder.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

class CamaraWidget extends CheckboxWidgetBuilder{
  @override
  Widget? buildWidget(Map<String, dynamic>? params) {
    return _CameraWidget();
  }
}

class _CameraWidget extends StatefulWidget {
  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<_CameraWidget> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  File? _image;
  String msgt ="";
  bool _isCamaraInicialized = false;
  String fotoPath ="";

  @override
  void initState() {
    super.initState();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller?.initialize().then(
      (_) {
        if(mounted){
          setState(() {
            _image = null;
            _isCamaraInicialized = true;
          });
        }
      }
    );
  }

  Future<void> _takePicture() async {
    try {

      await _initializeControllerFuture;


      final image = await _controller!.takePicture();

      Future.delayed(const Duration(seconds: 1),() async {
        await _controller!.dispose();
      });
      setState(() {
        fotoPath = image.path;
        _image = File(fotoPath);
      });

    } catch (e) {
      print(e);
    }
  }

  Future<void> _toggleCamaraPreview() async {
      if(_isCamaraInicialized){
        await _controller!.dispose();
        setState(() {
          _isCamaraInicialized = false;
          _controller = null;
        });
      }else{
        _initializeCamera();
      }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCamaraPreview,
      onDoubleTap: _isCamaraInicialized ? _takePicture:null,
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey[200],
            backgroundImage: _image != null ? FileImage(_image!) : null,
            child: _image == null || !_isCamaraInicialized ?
                (   _isCamaraInicialized ? ClipOval(child: CameraPreview(_controller!))
                    : const Icon(Icons.camera_alt, size: 50)
                ) : Text(msgt),
          ),
          const Text("1 tap toggle camara, doble tap take foto")
        ],
      ),
    );
  }
}