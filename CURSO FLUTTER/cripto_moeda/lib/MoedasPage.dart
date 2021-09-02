import 'package:cripto_moeda/models/Moedas.dart';
import 'package:cripto_moeda/pages/MoedasDetalhesPage.dart';
import 'package:cripto_moeda/repositories/MoedaRepository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoedasPage extends StatefulWidget {
  MoedasPage({Key? key}) : super(key: key);

  @override
  _MoedasPageState createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedaRepository.tabela;
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  List<Moedas> selecionada = [];

  appBarDinamia() {
    if (selecionada.isEmpty) {
      return AppBar(
        title: Text("Cripto Moedas"),
      );
    } else {
      return AppBar(
          leading: IconButton(
              onPressed: () {
                setState(() {
                  selecionada = [];
                });
              },
              icon: Icon(Icons.arrow_back)),
          title: Text('${selecionada.length} selecionadas'),
          backgroundColor: Colors.deepPurple[100],
          elevation: 2,
          iconTheme: IconThemeData(color: Colors.black87),
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ));
    }
  }

  mostrardetalhes(Moedas moedas) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => MoedasDetalhesPage(moedas: moedas)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamia(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int moeda) {
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            leading: (selecionada.contains(tabela[moeda])
                ? CircleAvatar(
                    child: Icon(Icons.check),
                  )
                : SizedBox(
                    child: Image.asset(tabela[moeda].icone),
                    width: 40,
                  )),
            title: Text(
              tabela[moeda].nome,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Text(
              real.format(tabela[moeda].preco),
            ),
            selected: selecionada.contains(tabela[moeda]),
            selectedTileColor: Colors.indigo[50],
            onLongPress: () {
              setState(() {
                (selecionada.contains(tabela[moeda]))
                    ? selecionada.remove(tabela[moeda])
                    : selecionada.add(tabela[moeda]);
              });
            },
            onTap: () => mostrardetalhes(tabela[moeda]),
          );
        },
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, __) => Divider(),
        itemCount: tabela.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selecionada.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {},
              label: Text("Favoritar"),
              icon: Icon(Icons.star),
            )
          : null,
    );
  }
}
