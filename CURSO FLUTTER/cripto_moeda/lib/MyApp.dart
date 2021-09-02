import 'package:flutter/material.dart';

import 'MoedasPage.dart';

class MyApp extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const MyApp({Key, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Modedas",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.deepPurpleAccent,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurpleAccent)),
        home: MoedasPage());
  }
}
