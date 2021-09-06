import 'dart:collection';
import 'package:cripto_moeda/models/Moedas.dart';
import 'package:flutter/material.dart';

class FavoritosRepository extends ChangeNotifier {
  List<Moedas> _lista = [];
  UnmodifiableListView<Moedas> get lista => UnmodifiableListView(_lista);

  salvaMoedasFavoritas(List<Moedas> moedas) {
    moedas.forEach((moeda) {
      if (!_lista.contains(moeda)) _lista.add(moeda);
    });
  }

  removerMoedasFavoritas(Moedas moeda) {
    _lista.remove(moeda);
  }
}
