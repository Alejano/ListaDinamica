import 'dart:convert';

import '../Model/Usuario.dart';
import 'ApiServicesIm.dart';
import 'package:listadinamica/Constants.dart';
import 'package:http/http.dart' as http;

class ApiServices implements ApiServicesImp{
  static final ApiServices _instance = ApiServices._internal();

  ApiServices._internal();

  factory ApiServices(){
    return _instance;
  }

  @override
  Future<List<Usuario>> GetUsersData() async {
    var response = await http.get(Uri(
      host: host,
      path: path,
      scheme: protocol
    ));
    if(response.statusCode == 200){
      dynamic jsonf = json.decode(response.body);
      List<Usuario> UserList = [];
      jsonf["data"]["employees"].map((e)=> UserList.add(Usuario.fromJson(e))).toList();
      return UserList;
    }else{
      throw Exception("Fallo la peticion");
    }
  }

}