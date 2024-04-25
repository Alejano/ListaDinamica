import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:listadinamica/HomePage/ViewModelProvider/HomeProvider.dart';
import 'package:provider/provider.dart';

import '../../ResultPage/ResultPageBody/ResultPage.dart';

class HomePage extends StatelessWidget {
  static String id = "Home";
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (context,stado,_){
          return Material(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height/3,
                      child: ListView.builder(
                          itemCount: stado.isChecket.length,
                          itemBuilder: (context,index){
                            return CheckboxListTile(
                                title: Text(stado.nombres[index]),
                                value: stado.isChecket[index],
                                onChanged: (bool? value)=> stado.toggleChecket(index, value!),
                            );
                          }
                      ),
                    ),
                  ),
                  const Divider(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: ()=> stado.verResultado(context),
                      child:const Text("Ver Resultado"))
                ],
              ),
            ),
          );
        }
    );
  }
}
