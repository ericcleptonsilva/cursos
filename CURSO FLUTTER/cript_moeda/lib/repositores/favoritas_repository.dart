// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:collection';

import 'package:cript_moeda/adapter/moedas_hive_adapter.dart';
import 'package:cript_moeda/models/moedas.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoritasRespository extends ChangeNotifier {
  final List<Moedas> _lista = [];

  late LazyBox box;

  FavoritasRespository() {
    _startRepository();
  }
  _startRepository() async {
    await _openBox();
    await _readFavoritas();
  }

  _openBox() async {
    Hive.registerAdapter(MoedasHiveAdapter());
    box = await Hive.openLazyBox<Moedas>('moedas_favoritas');
  }

  _readFavoritas() {
    box.keys.forEach((moeda) async {
      Moedas m = await box.get(moeda);
      _lista.add(m);
    });
    notifyListeners();
  }

  UnmodifiableListView<Moedas> get lista => UnmodifiableListView(_lista);
  saveAll(List<Moedas> moedas) {
    moedas.forEach((moeda) {
      if (!_lista.any((atual) => atual.sigla == moeda.sigla)) {
        _lista.add(moeda);
        box.put(moeda.sigla, moeda);
      }
    });
    notifyListeners();
  }

  remove(Moedas moeda) {
    _lista.remove(moeda);
    box.delete(moeda.sigla);
    notifyListeners();
  }
}
