// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable

import 'package:cript_moeda/configs/app_settings.dart';
import 'package:cript_moeda/models/moedas.dart';
import 'package:cript_moeda/pages/details_page.dart';
import 'package:cript_moeda/repositores/favoritas_repository.dart';
import 'package:cript_moeda/repositores/moedas_repository.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MoedasPage extends StatefulWidget {
  MoedasPage({Key? key}) : super(key: key);

  @override
  _MoedasPageState createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedasRepository.tabela;

  final title = 'Cripto Moedas';
  final moedaSeleciondas = 'Moedas selecionadas';
  final favoritar = 'FAVORITAR';
  final labalText = 'Salvar Favoritas';

  late NumberFormat real;
  late Map<String, String> localizacao;
  List<Moedas> selecionadas = [];
  late FavoritasRespository favoritas;

  readNumberFormat() {
    localizacao = context.watch<AppSettings>().locale;
    real = NumberFormat.currency(
        locale: localizacao['locale'], name: localizacao['name']);
  }

  changeLanguageButton() {
    final locale = localizacao['locale'] == 'pt_BR' ? 'en_US' : 'pt_BR';
    final name = localizacao['locale'] == 'pt_BR' ? 'R\$' : ' \$';
    final text = locale == 'pt_BR' ? 'Dollar' : 'Real';
    return PopupMenuButton(
        icon: Icon(Icons.language),
        itemBuilder: (context) => [
              PopupMenuItem(
                child: ListTile(
                  title: Text('Moeda: $text'),
                  leading: Icon(Icons.swap_vert),
                  onTap: () {
                    context.read<AppSettings>().setLocale(locale, name);
                    Navigator.pop(context);
                  },
                ),
              ),
            ]);
  }

  appBarDinamica() {
    if (selecionadas.isEmpty) {
      return AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          title,
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        actions: [changeLanguageButton()],
      );
    } else {
      return AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            setState(() {
              selecionadas = [];
            });
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          selecionadas.length.toString() + ' ' + moedaSeleciondas,
        ),
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
        titleTextStyle: TextStyle(
          color: Colors.blue,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }

  floatingActionButtons() {
    return selecionadas.isNotEmpty
        ? FloatingActionButton.extended(
            elevation: 3,
            backgroundColor: Colors.black,
            onPressed: () {},
            label: Text(
              favoritar,
              style: TextStyle(
                color: Colors.blue,
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : null;
  }

  details(Moedas moedas) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailsPage(moedas: moedas),
      ),
    );
  }

  limparselecionadas() {
    setState(() {
      selecionadas = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    favoritas = Provider.of<FavoritasRespository>(context);
    readNumberFormat();
    return Scaffold(
        appBar: appBarDinamica(),
        backgroundColor: Colors.white70,
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
          separatorBuilder: (_, __) => Divider(
            height: 5,
          ),
          itemCount: tabela.length,
          itemBuilder: (BuildContext context, int moeda) {
            return ListTile(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              leading: selecionadas.contains(tabela[moeda])
                  ? const CircleAvatar(
                      child: Icon(Icons.check),
                    )
                  : SizedBox(width: 40, child: Image.asset(tabela[moeda].icon)),
              title: Row(
                children: [
                  Text(tabela[moeda].name),
                  SizedBox(
                    width: 20,
                  ),
                  if (favoritas.lista
                      .any((fav) => fav.sigla == tabela[moeda].sigla))
                    Icon(Icons.star_rate, size: 15, color: Colors.amber)
                ],
              ),
              trailing: Text(
                real.format(tabela[moeda].preco),
              ),
              selected: selecionadas.contains(tabela[moeda]),
              selectedTileColor: Colors.black87,
              onLongPress: () {
                setState(
                  () {
                    selecionadas.contains(tabela[moeda])
                        ? selecionadas.remove(tabela[moeda])
                        : selecionadas.add(tabela[moeda]);
                  },
                );
              },
              onTap: () => details(tabela[moeda]),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: selecionadas.isNotEmpty
            ? FloatingActionButton.extended(
                onPressed: () {
                  favoritas.saveAll(selecionadas);
                  limparselecionadas();
                },
                backgroundColor: Colors.black87,
                icon: Icon(
                  Icons.star,
                  color: Colors.blue,
                ),
                label: Text(
                  labalText,
                  style: TextStyle(
                    color: Colors.blue,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                  ),
                ))
            : floatingActionButtons());
  }
}
