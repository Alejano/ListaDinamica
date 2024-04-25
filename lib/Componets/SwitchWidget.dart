import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CheckboxWidgetBuilder.dart';



class SwitchWidget implements CheckboxWidgetBuilder{

  @override
  Widget buildWidget(Map<String, dynamic>? params) {
    // Estado inicial
    bool isMale = params?['isMale'] ?? false;
    bool isFemale = !isMale;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: isMale,
              onChanged: (bool? value) {
                setState(() {
                  isMale = value!;
                  isFemale = !isMale;
                });
              },
            ),
            Text('Hombre'),
            SizedBox(width: 10),
            Checkbox(
              value: isFemale,
              onChanged: (bool? value) {
                setState(() {
                  isFemale = value!;
                  isMale = !isFemale;
                });
              },
            ),
            Text('Mujer'),
          ],
        );
      },
    );
  }

}