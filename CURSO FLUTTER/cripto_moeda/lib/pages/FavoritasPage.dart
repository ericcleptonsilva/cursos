import 'package:cripto_moeda/repositories/FavoritosRepository.dart';
import 'package:cripto_moeda/widgets/MoedaCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritasPage extends StatefulWidget {
  FavoritasPage({Key? key}) : super(key: key);

  @override
  _FavoritasPageState createState() => _FavoritasPageState();
}

class _FavoritasPageState extends State<FavoritasPage> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Moedas Favoritas',
        ),
      ),
      body: Container(
        color: Colors.indigo.withOpacity(0.05),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(12),
        child:
            Consumer<FavoritosRepository>(builder: (context, favoritas, child) {
          return favoritas.lista.isEmpty
              ? ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Ainda não há moedas favoritas!'),
                )
              : ListView.builder(
                  itemCount: favoritas.lista.length,
                  itemBuilder: (_, index) {
                    return MoedaCard(moedas: favoritas.lista[index]);
                  },
                );
        }),
      ),
    );
  }
}
