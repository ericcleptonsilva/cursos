import 'dart:collection';
import 'package:cripto_moeda/adapters/MoedaHiveAdapater.dart';
import 'package:cripto_moeda/models/Moedas.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoritosRepository extends ChangeNotifier {
  List<Moeda> _lista = [];
  late LazyBox box;

  FavoritosRepository() {
    _startRepository();
  }

  _startRepository() async {
    await _openBox();
    await _readFavoritos();
  }

  _openBox() async {
    Hive.registerAdapter(MoedaHiveAdapater());
    box = await Hive.openLazyBox<Moeda>('moedas_favoritas');
  }

  _readFavoritos() {
    box.keys.forEach((moeda) async {
      Moeda moedas = await box.get(moeda);
      _lista.add(moedas);
      notifyListeners();
    });
  }

  UnmodifiableListView<Moeda> get lista => UnmodifiableListView(_lista);

  salvaMoedasFavoritas(List<Moeda> moedas) {
    moedas.forEach((moeda) {
      if (!_lista.any((atual) => atual.sigla == moeda.sigla)) {
        _lista.add(moeda);
        box.put(moeda.sigla, moeda);
      }
    });
    notifyListeners();
  }

  removerMoedasFavoritas(Moeda moeda) {
    _lista.remove(moeda);
    box.delete(moeda.sigla);
    notifyListeners();
  }
}
