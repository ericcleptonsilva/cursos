// ignore_for_file: file_names, prefer_const_constructors

import 'package:cript_moeda/repositores/favoritas_repository.dart';
import 'package:cript_moeda/widgets/moedas_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final title = 'Moedas Favoritas';
  final titleView = 'Ainda não há moedas favoritas!';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
      backgroundColor: Colors.white70,
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(12),
        child: Consumer<FavoritasRespository>(
          builder: (context, favoritas, child) {
            return favoritas.lista.isEmpty
                ? ListTile(
                    leading: Icon(Icons.star_outlined),
                    title: Text(titleView),
                  )
                : ListView.builder(
                    itemCount: favoritas.lista.length,
                    itemBuilder: (_, index) {
                      return MoedasCard(
                        moedas: favoritas.lista[index],
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
