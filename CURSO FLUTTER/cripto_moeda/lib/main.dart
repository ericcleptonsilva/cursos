import 'package:cripto_moeda/configs/Appsettings.dart';
import 'package:cripto_moeda/configs/HiveConfig.dart';

import 'package:cripto_moeda/repositories/ContaRepository.dart';
import 'package:cripto_moeda/repositories/FavoritosRepository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MyApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();


  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ContaRepository()),
      ChangeNotifierProvider(create: (context) => Appsettings()),
      ChangeNotifierProvider(create: (context) => FavoritosRepository()),
    ],
    child: MyApp(),
  ));
}
