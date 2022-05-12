// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cript_moeda/database/db.dart';
import 'package:cript_moeda/models/moedas.dart';
import 'package:cript_moeda/models/posicao.dart';
import 'package:cript_moeda/pages/carteira_page.dart';
import 'package:cript_moeda/repositores/moedas_repository.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class ContaRepository extends ChangeNotifier {
  late Database db;
  List<Posicao> _carteira = [];
  //List<Historico> _historico = [];

  double _saldo = 0;

  get saldo => _saldo;

  List<Posicao> get carteira => _carteira;
  //List<Historico> get historico => _historico;

  ContaRepository() {
    _initRepository();
  }

  _initRepository() async {
    await _getSaldo();
    await _getCarteira();
    //await _getHistorico();
  }

  /*
    _getHistorico() async {
    _historico = [];
    List operacoes = await db.query('historico');
    operacoes.forEach((operacao) {
      Moeda moeda = MoedaRepository.tabela.firstWhere(
        (m) => m.sigla == operacao['sigla'],
      );
      _historico.add(Historico(
        dataOperacao:
            DateTime.fromMillisecondsSinceEpoch(operacao['data_operacao']),
        tipoOperacao: operacao['tipo_operacao'],
        moeda: moeda,
        valor: operacao['valor'],
        quantidade: double.parse(operacao['quantidade']),
      ));
    });
    notifyListeners();
  }
*/
  _getSaldo() async {
    db = await DB.instance.database;
    List conta = await db.query('conta', limit: 1);
    _saldo = conta.first['saldo'];
    notifyListeners();
  }

  setSaldo(double valor) async {
    db = await DB.instance.database;
    db.update('conta', {
      'saldo': valor,
    });
    _saldo = valor;
    notifyListeners();
  }

  _getCarteira() async {
    _carteira = [];
    List posicoes = await db.query('carteira');
    posicoes.forEach((posicao) {
      Moedas moedas = MoedasRepository.tabela.firstWhere(
        (m) => m.sigla == posicao['sigla'],
      );
      _carteira.add(Posicao(
        moedas: moedas,
        quantidade: double.parse(posicao['quantidade']),
      ));
    });
    notifyListeners();
  }

  comprar(Moedas moedas, double valor) async {
    db = await DB.instance.database;

    await db.transaction((txn) async {
      //verificar se a moeda já existe
      final posicaoMoeda = await txn.query(
        'carteira',
        where: 'sigla = ?',
        whereArgs: [moedas.sigla],
      );

      // se não existir a moeda em carteira, adiciona
      if (posicaoMoeda.isEmpty) {
        await txn.insert(
          'carteira',
          {
            'moeda': moedas.name,
            'sigla': moedas.sigla,
            'quantidade': (valor / moedas.preco).toString()
          },
        );
      } else {
        // se existir a moeda em carteira, soma a quantidade
        final atual = double.parse(posicaoMoeda.first['quantidade'].toString());
        await txn.update(
            'carteira',
            {
              'quantidade': ((valor / moedas.preco) + atual).toString(),
            },
            where: 'sigla = ?',
            whereArgs: [moedas.sigla]);
      } //else

      // Inserir a compra no histórico
      await txn.insert('historico', {
        'sigla': moedas.sigla,
        'moeda': moedas.name,
        'quantidade': (valor / moedas.preco).toString(),
        'valor': valor,
        'tipo_operacao': 'Compra',
        'data_operacao': DateTime.now().millisecondsSinceEpoch
      });
      // Atualizar o saldo
      await txn.update('conta', {'saldo': saldo - valor});

      await _initRepository();
      notifyListeners();
    });
  } //final da Void comprar

}//final da class
