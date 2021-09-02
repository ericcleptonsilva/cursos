import 'package:cripto_moeda/models/Moedas.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MoedasDetalhesPage extends StatefulWidget {
  Moedas moedas;
  MoedasDetalhesPage({Key? key, required this.moedas}) : super(key: key);

  @override
  _MoedasDetalhesPageState createState() => _MoedasDetalhesPageState();
}

class _MoedasDetalhesPageState extends State<MoedasDetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.moedas.nome),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: 100,
                  child: Image.asset(widget.moedas.icone),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
