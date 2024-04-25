import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listadinamica/Componets/CheckboxWidgetBuilder.dart';

class TextFieldWidget implements CheckboxWidgetBuilder{


  @override
  Widget? buildWidget(Map<String, dynamic>? params) {
    TextEditingController? controller ;
    TextInputType? keyboardType ;
    InputDecoration? decoration ;
    List<TextInputFormatter> inputFormatters = [];
    int maxLength = TextField.noMaxLength;
    if(params != null) {
      controller = (params['controller']!=null)?params['controller']:null;
      keyboardType = (params['keyboardType']!=null)?params['keyboardType']:null;
      decoration = (params['decoration']!=null)?params['decoration']:null;
      inputFormatters = (params['inputFormatters'] != null) ? params['inputFormatters']:[];
      maxLength = (params['maxLength'] != null) ? params['maxLength'] : TextField.noMaxLength;
    }
    return TextField(
      maxLength: maxLength,
      controller: controller,
      keyboardType: keyboardType,
      decoration: decoration ?? const InputDecoration(),
      inputFormatters: inputFormatters,
    );
  }

}