import 'package:cripto_moeda/configs/Appsettings.dart';
import 'package:cripto_moeda/models/Posicao.dart';
import 'package:cripto_moeda/repositories/ContaRepository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CarteiraPage extends StatefulWidget {
  CarteiraPage({Key? key}) : super(key: key);

  @override
  _CarteiraPageState createState() => _CarteiraPageState();
}

class _CarteiraPageState extends State<CarteiraPage> {
  int index = 0;
  double totalCarteira = 0;
  double saldo = 0;
  late NumberFormat real;
  late ContaRepository contaRepository;
  String graficoLabel = '';
  double graficoValor = 0;
  List<Posicao> posicaoCarteira = [];

  @override
  Widget build(BuildContext context) {
    contaRepository = context.watch<ContaRepository>();
    final local = context.watch<Appsettings>().localeName;
    real = NumberFormat.currency(locale: local['locale'], name: local['name']);
    saldo = contaRepository.saldo;
    setTotalCarteira();

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 48, bottom: 8),
              child: Text("Valor da Carteira"),
            ),
            Text(
              real.format(totalCarteira),
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                letterSpacing: -1.5,
                color: Colors.deepPurpleAccent,
              ),
            ),
            loadGrafico()
          ],
        ),
      ),
    );
  }

  setTotalCarteira() {
    final listaCarteira = contaRepository.carteira;
    setState(() {
      totalCarteira = contaRepository.saldo;
      for (var posicao in listaCarteira) {
        totalCarteira += posicao.moedas.preco * posicao.quantidade;
      }
    });
  }

  setGraficoDados(int index) {
    if (index < 0) return;
    if (index == posicaoCarteira.length) {
      graficoLabel = 'Saldo';
      graficoValor = contaRepository.saldo;
    } else {
      graficoLabel = posicaoCarteira[index].moedas.nome;
      graficoValor = posicaoCarteira[index].moedas.preco *
          posicaoCarteira[index].quantidade;
    }
  }

  loadCarteira() {
    //setGraficoDados(index);
    posicaoCarteira = contaRepository.carteira;
    final tamanhoLista = posicaoCarteira.length + 1;

    return List.generate(tamanhoLista, (i) {
      final isTouched = i == index;
      final isSaldo = i == tamanhoLista - 1;
      final fontSize = isTouched ? 18.0 : 14.0;
      final radius = isTouched ? 60.0 : 50.0;
      final color = isTouched ? Colors.tealAccent : Colors.tealAccent[400];

      double porcentagem = 0;
      if (!isSaldo) {
        porcentagem = posicaoCarteira[i].moedas.preco *
            posicaoCarteira[i].quantidade /
            totalCarteira;
      } else {
        porcentagem = (contaRepository.saldo > 0)
            ? contaRepository.saldo / totalCarteira
            : 0;
      }
      porcentagem *= 100;

      return PieChartSectionData(
          color: color,
          value: porcentagem,
          title: '${porcentagem.toStringAsFixed(0)}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ));
    });
  }

  loadGrafico() {
    return (contaRepository.saldo <= 0)
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurpleAccent,
              ),
            ),
          )
        : Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: PieChart(PieChartData(
                  sectionsSpace: 1,
                  centerSpaceRadius: 110,
                  sections: loadCarteira(),
                  pieTouchData: PieTouchData(
                      touchCallback: (touch) => setState(() {
                            index = touch.touchedSection!.touchedSectionIndex;
                            setGraficoDados(index);
                          })),
                )),
              ),
              Column(
                children: [
                  Text(
                    graficoLabel,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal,
                    ),
                  ),
                  Text(
                    real.format(graficoValor),
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  )
                ],
              )
            ],
          );
  }
}
