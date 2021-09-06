import 'package:cripto_moeda/configs/Appsettings.dart';
import 'package:cripto_moeda/models/Moedas.dart';
import 'package:cripto_moeda/pages/MoedasDetalhesPage.dart';
import 'package:cripto_moeda/repositories/FavoritosRepository.dart';
import 'package:cripto_moeda/repositories/MoedaRepository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MoedasPage extends StatefulWidget {
  MoedasPage({Key? key}) : super(key: key);

  @override
  _MoedasPageState createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedaRepository.tabela;
  late NumberFormat real;
  late Map<String, String> locais;
  List<Moedas> selecionada = [];
  late FavoritosRepository favoritosRepository;

  readNumberFormart() {
    locais = context.watch<Appsettings>().localeName;
    real =
        NumberFormat.currency(locale: locais['locale'], name: locais['name']);
  }

  changeLanguageButton() {
    final locale = locais['locale'] == 'pt_BR' ? 'un_US' : 'pt_BR';
    final name = locais['locale'] == 'pt_BR' ? '\$' : 'R\$';
    return PopupMenuButton(
      icon: Icon(Icons.language),
      itemBuilder: (context) => [
        PopupMenuItem(
            child: ListTile(
          leading: Icon(Icons.swap_vert),
          title: Text('Usar $locale'),
          onTap: () {
            context.read<Appsettings>().setLocale(locale, name);
            Navigator.pop(context);
          },
        ))
      ],
    );
  }

  appBarDinamica() {
    if (selecionada.isEmpty) {
      return AppBar(
        title: Text("Cripto Moedas"),
        actions: [
          changeLanguageButton(),
        ],
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

  limparSelecionadas() {
    setState(() {
      selecionada = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    /// favoritosRepository = Provider.of<FavoritosRepository>(context);

    favoritosRepository = context.watch<FavoritosRepository>();
    readNumberFormart();

    return Scaffold(
      appBar: appBarDinamica(),
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
            title: Row(
              children: [
                Text(
                  tabela[moeda].nome,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (favoritosRepository.lista.contains(tabela[moeda]))
                  Icon(
                    Icons.circle,
                    color: Colors.amber,
                    size: 8,
                  )
              ],
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
        padding: EdgeInsets.only(top: 10),
        separatorBuilder: (_, __) => Divider(),
        itemCount: tabela.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selecionada.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {
                favoritosRepository.salvaMoedasFavoritas(selecionada);
                limparSelecionadas();
              },
              label: Text("Favoritar"),
              icon: Icon(Icons.star),
            )
          : null,
    );
  }
}
