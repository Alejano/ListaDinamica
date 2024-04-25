import 'package:flutter/material.dart';
import 'package:listadinamica/ViewModelProvider/HomeProvider.dart';
import 'package:listadinamica/locator/setupLocator.dart';
import 'package:provider/provider.dart';
import 'package:listadinamica/ui/HomePage/HomePageBody/HomePage.dart';




void main(){
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => HomeProvider()),
    ],
        child:MaterialApp(
          home: const HomePage(),
          initialRoute: HomePage.id,
        )
    );
  }
}