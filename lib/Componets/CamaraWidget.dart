import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:listadinamica/Componets/CheckboxWidgetBuilder.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

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

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller?.initialize();
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;

      final path = join(
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );

      await _controller?.takePicture();

      setState(() {
        _image = File(path);
      });
    } catch (e) {
      print(e);
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
      onTap: _image == null ? _takePicture : null,
      child: CircleAvatar(
        radius: 60,
        backgroundColor: Colors.grey[200],
        backgroundImage: _image != null ? FileImage(_image!) : null,
        child: _image == null ? Icon(Icons.camera_alt, size: 50) : null,
      ),
    );
  }
}