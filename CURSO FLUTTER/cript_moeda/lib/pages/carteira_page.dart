// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, unused_import, implementation_imports

import 'package:cript_moeda/configs/app_settings.dart';
import 'package:cript_moeda/models/posicao.dart';
import 'package:cript_moeda/repositores/conta_repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';

class CarteiraPage extends StatefulWidget {
  CarteiraPage({Key? key}) : super(key: key);

  @override
  _CarteiraPageState createState() => _CarteiraPageState();
}

int index = 0;
double totalCarteira = 0;
double saldo = 0;

late NumberFormat real;
late ContaRepository conta;

String graficoLabel = '';
double graficoValor = 0;

List<Posicao> carteira = [];

class _CarteiraPageState extends State<CarteiraPage> {
  @override
  Widget build(BuildContext context) {
    conta = context.watch<ContaRepository>();
    final local = context.watch<AppSettings>().locale;
    real = NumberFormat.currency(locale: local['locale'], name: local['name']);

    saldo = conta.saldo;
    setTotalCarteira();
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 48,
                bottom: 8,
              ),
              child: Text(
                'Carteira',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Saldo: ${real.format(totalCarteira)}',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                letterSpacing: -1.5,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            loadGrafico()
          ],
        ),
      ),
    );
  }

  setTotalCarteira() {
    final carteiraList = conta.carteira;
    setState(() {
      totalCarteira = conta.saldo;
      for (var posicao in carteiraList) {
        totalCarteira += posicao.moedas.preco * posicao.quantidade;
      }
    });
  }

  loadGrafico() {
    return (conta.saldo <= 0)
        ? SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          )
        : Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      sectionsSpace: 5,
                      centerSpaceRadius: 110,
                      sections: loadCarteira(),
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouch) =>
                            setState(() {
                          index = pieTouch!.touchedSection!.touchedSectionIndex;
                          setGraficodados(index);
                        }),
                      )),
                ),
              ),
              Column(
                children: [
                  Text(graficoLabel,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  Text(real.format(graficoValor),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ],
              )
            ],
          );
  }

  List<PieChartSectionData> loadCarteira() {
    setGraficodados(index);
    carteira = conta.carteira;
    final tamanhoLista = carteira.length + 1;

    return List.generate(tamanhoLista, (i) {
      final isTouched = i == index;
      final isSaldo = i == tamanhoLista - 1;
      final fontSize = isTouched ? 18.0 : 14.0;
      final radius = isTouched ? 60.0 : 50.0;
      final color = isTouched ? Colors.tealAccent : Colors.tealAccent[400];

      double porcentagem = 0;
      if (!isSaldo) {
        porcentagem =
            carteira[i].moedas.preco * carteira[i].quantidade / totalCarteira;
      } else {
        porcentagem = (conta.saldo > 0) ? conta.saldo / totalCarteira : 0;
      }
      porcentagem *= 100;

      return PieChartSectionData(
        color: color,
        value: porcentagem,
        title: '${porcentagem.toStringAsFixed(0)}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      );
    });
  }

  setGraficodados(int index) {
    if (index < 0) return;

    if (index == carteira.length) {
      graficoLabel = 'Saldo';
      graficoValor = conta.saldo;
    } else {
      graficoLabel = carteira[index].moedas.name;
      graficoValor = carteira[index].moedas.preco * carteira[index].quantidade;
    }
  }
}
