import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listadinamica/Componets/CheckboxWidgetBuilder.dart';

class ColorWidget extends CheckboxWidgetBuilder{
  @override
  Widget? buildWidget(Map<String, dynamic>? params) {
    List<Color> availableColors = params?['availableColors'] ?? [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.purple
    ];  // Lista de colores predeterminada

    // Estado inicial, selecciona el primer color por defecto si no se pasa ninguno
    Color selectedColor = params?['selectedColor'] ?? availableColors.first;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Wrap(
          children: availableColors.map((color) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: ChoiceChip(
                label: Text(' '),
                selected: selectedColor == color,
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) selectedColor = color;  // Actualiza el color seleccionado
                  });
                },
                selectedColor: color,
                backgroundColor: color.withOpacity(0.6),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}