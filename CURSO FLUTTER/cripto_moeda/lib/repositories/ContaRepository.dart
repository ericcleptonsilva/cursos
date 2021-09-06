import 'package:cripto_moeda/database/HelperDb.dart';
import 'package:cripto_moeda/models/Posicao.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqlite_api.dart';

class ContaRepository extends ChangeNotifier {
  late Database database;

  List<Posicao> _carteira = [];
  double _saldo = 0;

  get saldo => _saldo;
  List<Posicao> get carteira => _carteira;

  ContaRepository() {
    _initRepository();
  }
  _initRepository() async {
    await _getSaldo();
  }

  _getSaldo() async {
    database = await HelperDb.instanciaHelperDb.database;
    List conta = await database.query('conta', limit: 1);
    _saldo = conta.first['saldo'];
    notifyListeners();
  }

  setSaldo(double valor) async {
    database = await HelperDb.instanciaHelperDb.database;
    database.update('conta', {
      'saldo': valor,
    });
    _saldo = valor;
    notifyListeners();
  }
}
