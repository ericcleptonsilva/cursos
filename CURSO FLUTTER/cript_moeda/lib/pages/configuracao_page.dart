// ignore_for_file: unused_local_variable, prefer_const_constructors, implementation_imports, prefer_const_literals_to_create_immutables

import 'package:cript_moeda/configs/app_settings.dart';
import 'package:cript_moeda/repositores/conta_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';

class CongifuracoesPage extends StatefulWidget {
  const CongifuracoesPage({Key? key}) : super(key: key);

  @override
  State<CongifuracoesPage> createState() => _CongifuracoesPageState();
}

class _CongifuracoesPageState extends State<CongifuracoesPage> {
  @override
  Widget build(BuildContext context) {
    final conta = context.watch<ContaRepository>();
    final local = context.watch<AppSettings>().locale;
    NumberFormat real =
        NumberFormat.currency(locale: local['locale'], name: local['name']);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Configurações',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              title: Text('Saldo'),
              subtitle: Text(
                real.format(conta.saldo),
                style: TextStyle(fontSize: 20),
              ),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: updateSaldo,
              ),
            ),
          ],
        ),
      ),
    );
  }

  updateSaldo() async {
    final form = GlobalKey<FormState>();
    final valor = TextEditingController();
    final conta = context.read<ContaRepository>();

    valor.text = conta.saldo.toString();

    AlertDialog dialog = AlertDialog(
        title: Text('Atualizar Saldo'),
        content: Form(
            key: form,
            child: TextFormField(
              controller: valor,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
              ],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            )),
        actions: [
          TextButton(
            child: Text('Cancelar'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: Text('Atualizar'),
            onPressed: () {
              if (form.currentState!.validate()) {
                conta.setSaldo(double.parse(valor.text));
                Navigator.pop(context);
              }
            },
          )
        ]);
    showDialog(context: context, builder: (_) => dialog);
  }
}
