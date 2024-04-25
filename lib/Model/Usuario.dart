import 'package:intl/intl.dart';

class Usuario{
  int id;
  String name;
  String last_name;
  String birthday;

  Usuario({
    required this.id,
    required this.name,
    required this.last_name,
    required this.birthday
  });

  factory Usuario.fromJson(dynamic json) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(json["birthday"]);
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return Usuario(
    id: (json["id"]!= null)?json["id"]:0,
    name: (json["name"]!= null)?json["name"]:"",
    last_name: (json["last_name"]!= null)?json["last_name"]:"",
    birthday:(json["birthday"]!= null)?formatter.format(date).toString():"",
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "id" : id,
        "name" : name,
        "last_name": last_name,
        "birthday": birthday,
      };
}