import '../Model/Usuario.dart';

abstract class ApiServicesImp{
  Future<List<Usuario>> GetUsersData();
}