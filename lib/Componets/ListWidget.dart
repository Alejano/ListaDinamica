import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listadinamica/Componets/CheckboxWidgetBuilder.dart';
import 'package:listadinamica/Services/ApiServices.dart';
import 'package:listadinamica/Services/ApiServicesIm.dart';

import '../Model/Usuario.dart';

class ListWidget implements CheckboxWidgetBuilder{
  final ApiServicesImp _apiServices;

  ListWidget(this._apiServices);

  @override
  Widget? buildWidget(Map<String, dynamic>? params) {
    return FutureBuilder<List<Usuario>>(
      future: _apiServices.GetUsersData(),
      builder: (BuildContext context, AsyncSnapshot<List<Usuario>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {

          return SingleChildScrollView(
            child: Container(
              child: SizedBox(
                height: MediaQuery.of(context).size.height/5,
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var user = snapshot.data![index];
                    return ListTile(
                      title: Text("${user.name} ${user.last_name}"),
                      leading: Text(user.id.toString()),
                      subtitle: Text(user.birthday.toString()),
                    );
                  },
                ),
              ),
            ),
          );
        }
      },
    );
  }

}