import 'package:cripto_moeda/database/HelperDb.dart';
import 'package:cripto_moeda/models/Moedas.dart';
import 'package:cripto_moeda/models/Posicao.dart';
import 'package:cripto_moeda/repositories/MoedaRepository.dart';
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
    await _getCarteira();
  }

  _getSaldo() async {
    database = await HelperDb.instanciaHelperDb.dataBase;
    List conta = await database.query('conta', limit: 1);
    _saldo = conta.first['saldo'];
    notifyListeners();
  }

  setSaldo(double valor) async {
    database = await HelperDb.instanciaHelperDb.dataBase;
    database.update('conta', {
      'saldo': valor,
    });
    _saldo = valor;
    notifyListeners();
  }

  _getCarteira() async {
    _carteira = [];
    List posicoes = await database.query('carteira');
    posicoes.forEach((posicao) {
      Moeda moeda = MoedaRepository.tabela.firstWhere(
        (moeda) => moeda.sigla == posicao['sigla'],
      );
      _carteira.add(Posicao(
        moeda: moeda,
        quantidade: double.parse(posicao['quantidade']),
      ));
    });
    notifyListeners();
  }

  Future<void> comprar(Moeda moeda, double valor) async {
    database = HelperDb.instanciaHelperDb.dataBase;
    await database.transaction((txn) async {
      // verificar se a moeda foi comprada antes
      final posicaoMoeda = await txn.query(
        'carteira',
        where: 'sigla = ?',
        whereArgs: [moeda.sigla],
      );
      // se não tem a moeda em carteira
      if (posicaoMoeda.isEmpty) {
        await txn.insert('carteira', {
          'sigla': moeda.sigla,
          'moeda': moeda.nome,
          'quantidade': (valor / moeda.preco).toString()
        });
      }
      //Já tem a moeda na carteira
      else {
        final moedaAtual =
            double.parse(posicaoMoeda.first['quantidade'].toString());
        await txn.update(
          'carteira',
          {'quantidade': ((valor / moeda.preco) + moedaAtual).toString()},
          where: 'sigla = ?',
          whereArgs: [moeda.sigla],
        );
      }
      //Inserir a compra no histórico
      await txn.insert('historico', {
        'sigla': moeda.sigla,
        'moeda': moeda.nome,
        'quantidade': (valor / moeda.preco).toString(),
        'valor': valor,
        'tipo_operacao': 'compra',
        'data_operacao': DateTime.now().millisecondsSinceEpoch,
      });

      //atualizar o saldo
      await txn.update('conta', {'saldo': saldo - valor});
    });

    await _initRepository();
    notifyListeners();
  }
}
