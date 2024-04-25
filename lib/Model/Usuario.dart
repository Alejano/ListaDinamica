class Usuario{
  int id;
  String nombre;
  String last_name;
  String birthday;

  Usuario({
    required this.id,
    required this.nombre,
    required this.last_name,
    required this.birthday
  });

  factory Usuario.fromJson(dynamic json) => Usuario(
    id: (json["id"]!= null)?json["id"]:"",
    nombre: (json["nombre"]!= null)?json["nombre"]:"",
    last_name: (json["last_name"]!= null)?json["last_name"]:"",
      birthday:(json["birthday"]!= null)?json["birthday"]:"",
  );

  Map<String, dynamic> toJson() =>
      {
        "id" : id,
        "nombre" : nombre,
        "last_name": last_name,
        "birthday": birthday,
      };
}