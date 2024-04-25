import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listadinamica/Componets/CamaraWidget.dart';
import 'package:listadinamica/Componets/CheckboxWidgetBuilder.dart';
import 'package:listadinamica/Componets/ColorWidget.dart';
import 'package:listadinamica/Componets/DateWidget.dart';
import 'package:listadinamica/Componets/ListWidget.dart';
import 'package:listadinamica/Componets/SwitchWidget.dart';
import 'package:listadinamica/Componets/TextFieldWidget.dart';
import 'package:provider/provider.dart';

import '../../setupLocator.dart';

class HomeProvider extends ChangeNotifier{


  List<bool> _opciones = [false,false,false,false,false,false,false];
  List<String> nombres = [
    "Cámara",
    "Lista de empleados",
    "Nombre completo",
    "Número telefónico",
    "Fecha de nacimiento",
    "Sexo (Masculino / Femenino)",
    "Color Favorito"
  ];
  List<Map<String, dynamic>> params = [
    {
      'controller': TextEditingController(),
      'keyboardType': TextInputType.number,
      'decoration':const InputDecoration(
        labelText: 'Enter your number',
        icon: Icon(Icons.phone),
        border: OutlineInputBorder(),
      ),
      'inputFormatters': [FilteringTextInputFormatter.digitsOnly],
    },
    {},
    {
      'maxLength': 35,
      'keyboardType':const TextInputType.numberWithOptions(signed: true),
      'decoration':const InputDecoration(
        labelText: 'Nombre Completo',
        icon: Icon(Icons.perm_identity),
        border: OutlineInputBorder(),
      ),
      'inputFormatters': [FilteringTextInputFormatter.allow(RegExp('[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ ]'))],
    },
    {
      'maxLength': 10,
      'controller': TextEditingController(),
      'keyboardType': TextInputType.number,
      'decoration':const InputDecoration(
        labelText: 'Telefono',
        icon: Icon(Icons.phone),
        border: OutlineInputBorder(),
      ),
      'inputFormatters': [FilteringTextInputFormatter.digitsOnly],
    },
    {"format":"dd-MM-yyyy","context":""},
    {
      'isMale': false,
    },
    {
      'availableColors':[
        Colors.red,
        Colors.green,
        Colors.blue,
        Colors.yellow,
        Colors.purple,
        Colors.lightBlueAccent,
        Colors.black,
      ]
    },
  ];
  List<CheckboxWidgetBuilder> builders = [
    CamaraWidget(),
    locator<ListWidget>(),
    TextFieldWidget(),
    TextFieldWidget(),
    locator<DateWidget>(),
    SwitchWidget(),
    locator<ColorWidget>(),
  ];


  List<bool> get isChecket => _opciones;
  List<int> getindexList(){
    List<int> indexs = [];
    for(var x =0;x<_opciones.length;x++){
      if(_opciones[x]){
        indexs.add(x);
      }
    }
    print(indexs);
    return indexs;
  }

  void toggleChecket(int index, bool value){
      _opciones[index] = value;
      notifyListeners();
  }


}