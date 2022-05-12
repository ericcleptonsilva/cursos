// ignore_for_file: prefer_const_constructors

import 'package:cript_moeda/configs/app_settings.dart';
import 'package:cript_moeda/pages/home_page.dart';
import 'package:cript_moeda/repositores/conta_repository.dart';
import 'package:cript_moeda/repositores/favoritas_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'configs/hive_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ContaRepository()),
      ChangeNotifierProvider(create: (context) => FavoritasRespository()),
      ChangeNotifierProvider(create: (context) => AppSettings()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
