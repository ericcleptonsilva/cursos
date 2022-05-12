// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:cript_moeda/models/moedas.dart';
import 'package:cript_moeda/repositores/conta_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:cript_moeda/configs/app_settings.dart';

class DetailsPage extends StatefulWidget {
  Moedas moedas;
  DetailsPage({Key? key, required this.moedas}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  final _formKey = GlobalKey<FormState>();
  final _valor = TextEditingController();
  double quantidade = 0;
  late ContaRepository conta;

  comprar() async {
    if (_formKey.currentState!.validate()) {
      //Salvar compra
       await conta.comprar(widget.moedas, double.parse(_valor.text));
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black,
        content: Text(
          'Compra realizada com sucesso!',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.2,
            color: Colors.blue,
          ),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    readNumberFormat();
    conta = Provider.of<ContaRepository>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(widget.moedas.name),
        titleTextStyle: TextStyle(
          color: Colors.blue,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      child: Image.asset(widget.moedas.icon),
                      width: 75,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      real.format(
                        widget.moedas.preco,
                      ),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            (quantidade > 0)
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        bottom: 20,
                      ),
                      padding: EdgeInsets.all(15),
                      decoration:
                          BoxDecoration(color: Colors.blue.withOpacity(0.06)),
                      child: Text(
                        '$quantidade ${widget.moedas.sigla}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1.2,
                            color: Colors.blue,
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
            Padding(
              padding: const EdgeInsets.only(
                right: 25,
                left: 25,
              ),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _valor,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      gapPadding: 5,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    labelText: 'Valor',
                    prefixText: 'R\$',
                    prefixStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    suffixText:
                        'reais', //double.parse(a) > 1 ? 'reais' : 'real'
                    suffixStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),

                  // ignore: todo
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor digite o valor desejado!';
                    } else if (double.parse(value) < 50) {
                      return 'Compra minima R\$50,00';
                    } else if (double.parse(value) > conta.saldo) {
                      return 'Você não tem saldo suficiente!';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      quantidade = (value.isEmpty)
                          ? 0
                          : double.parse(value) / widget.moedas.preco;
                    });
                  },
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top: 25, right: 25, left: 25),
              child: ElevatedButton(
                onPressed: comprar,
                child: Row(
                  children: const [
                    Icon(
                      Icons.check,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Comprar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
    readNumberFormat() {
    final loc = context.watch<AppSettings>().locale;
    real = NumberFormat.currency(locale: loc['locale'], name: loc['name']);
  }
}
