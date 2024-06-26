import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:listadinamica/ViewModelProvider/HomeProvider.dart';
import 'package:listadinamica/ui/ResultPage/Appbar.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBar(context,"Resultado"),
      body: Consumer<HomeProvider>(
          builder: (context,stado,_){
            return Material(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height/8,
                    child: ListView.separated(
                        itemCount: stado.getindexList().length,
                        itemBuilder: (context,index){
                          int indexElemento = stado.getindexList()[index];
                          if(indexElemento == 4) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: stado.builders[indexElemento].buildWidget({"format":"dd-MM-yyyy","context":context}),
                            );
                          }else{
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: stado.builders[indexElemento].buildWidget(
                                  stado.params[indexElemento]),
                            );
                          }
                        }, separatorBuilder: (BuildContext context, int index) => const Divider(),
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
