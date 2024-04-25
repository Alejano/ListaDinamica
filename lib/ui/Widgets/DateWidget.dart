import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listadinamica/ui/Widgets/CheckboxWidgetBuilder.dart';
import 'package:intl/intl.dart';

class DateWidget implements CheckboxWidgetBuilder{


  @override
  Widget? buildWidget(Map<String, dynamic>? params) {
    TextEditingController controller = TextEditingController();
    String format = params?['format'] ?? 'dd-MM-yyyy';  // Formato por defecto
    DateFormat dateFormat = DateFormat(format);

    void pickDate(BuildContext context) async {
      DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),  // Fecha inicial en el calendario
          lastDate: DateTime(2100)   // Fecha final en el calendario
      );
      if (pickedDate != null) {
        String formattedDate = dateFormat.format(pickedDate);
        controller.text = formattedDate;
      }
    }

    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.calendar_today),
        labelText: 'Selecciona una Fecha',
      ),
      readOnly: true,
      onTap: () => pickDate(params?['context']),
    );
  }

}