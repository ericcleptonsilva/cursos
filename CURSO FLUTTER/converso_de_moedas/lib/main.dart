import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const request =
    "https://api.hgbrasil.com/finance?format=json-cors&key=f7f4e3c6";
Future<Map> getData() async {
  http.Response response = await http.get(request);
  return jsonDecode(response.body);
}

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          hintStyle: TextStyle(color: Colors.amber),
        )),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  double dolar;
  double euro;

  void _clearAll() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 8,
        title: Text(
          "Conversor",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  "Carregando dados...",
                  style: TextStyle(color: Colors.amberAccent, fontSize: 25),
                  textAlign: TextAlign.center,
                  // ignore: missing_return
                ),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Carregando dados...",
                    style: TextStyle(color: Colors.amberAccent, fontSize: 25),
                    textAlign: TextAlign.center,
                    // ignore: missing_return
                  ),
                );
              } else {
                dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
                return SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Icon(
                      Icons.monetization_on,
                      size: 150,
                      color: Colors.amberAccent,
                    ),
                    Divider(
                      height: 10,
                    ),
                    buildTextFiled(
                        "Reais", "R\$", realController, _realChanged),
                    Divider(
                      height: 10,
                    ),
                    buildTextFiled(
                        "Dolares", "US\$", dolarController, _dolarChanged),
                    Divider(
                      height: 10,
                    ),
                    buildTextFiled("Euro", "€", euroController, _euroChanged),
                  ],
                ));
              }
          }
        },
      ),
    );
  }
}

Widget buildTextFiled(
    String label, String prexi, TextEditingController c, Function f) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.amberAccent, fontSize: 25),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amberAccent),
        ),
        prefixText: prexi),
    style: TextStyle(
        color: Colors.amberAccent, fontSize: 25, fontWeight: FontWeight.w600),
    onChanged: f,
    keyboardType: TextInputType.number,
  );
}
