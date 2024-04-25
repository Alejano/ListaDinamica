import 'package:get_it/get_it.dart';
import 'package:listadinamica/Componets/CamaraWidget.dart';
import 'package:listadinamica/Componets/ColorWidget.dart';
import 'package:listadinamica/Componets/DateWidget.dart';
import 'package:listadinamica/Componets/SwitchWidget.dart';
import 'package:listadinamica/Services/ApiServicesIm.dart';

import 'Componets/ListWidget.dart';
import 'Services/ApiServices.dart';


final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<ApiServicesImp>(() => ApiServices());

  locator.registerFactory(() => ListWidget(locator<ApiServicesImp>()));
  locator.registerFactory(() => DateWidget());
  locator.registerFactory(() => SwitchWidget());
  locator.registerFactory(() => ColorWidget());
  locator.registerFactory(() => CamaraWidget());
}
