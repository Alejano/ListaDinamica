import 'package:get_it/get_it.dart';
import 'package:listadinamica/ui/Widgets/CamaraWidget.dart';
import 'package:listadinamica/ui/Widgets/ColorWidget.dart';
import 'package:listadinamica/ui/Widgets/DateWidget.dart';
import 'package:listadinamica/ui/Widgets/SwitchWidget.dart';
import 'package:listadinamica/ui/Widgets/ListWidget.dart';
import 'package:listadinamica/Services/ApiServicesIm.dart';
import '../Services/ApiServices.dart';


final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<ApiServicesImp>(() => ApiServices());

  locator.registerFactory(() => ListWidget(locator<ApiServicesImp>()));
  locator.registerFactory(() => DateWidget());
  locator.registerFactory(() => SwitchWidget());
  locator.registerFactory(() => ColorWidget());
  locator.registerFactory(() => CamaraWidget());
}
