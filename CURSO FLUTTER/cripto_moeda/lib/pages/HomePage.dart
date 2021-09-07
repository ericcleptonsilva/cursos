import 'package:cripto_moeda/MoedasPage.dart';
import 'package:cripto_moeda/pages/CarteiraPage.dart';
import 'package:cripto_moeda/pages/ConfiguracoesPage.dart';
import 'package:cripto_moeda/pages/FavoritasPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  PageController? myPageController;

  @override
  void initState() {
    myPageController = PageController(initialPage: paginaAtual);
    super.initState();
  }

  setPaginaAtual(page) {
    setState(() {
      paginaAtual = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: setPaginaAtual,
        controller: myPageController,
        children: [
          MoedasPage(),
          FavoritasPage(),
          CarteiraPage(),
          ConfiguracoesPage(),
          
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.all_inbox,
              ),
              label: 'Todos'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star_outline,
              ),
              label: 'Favoritos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: 'Carteira'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shop,
              ),
              label: 'Conta'),
         
        ],
        onTap: (page) {
          myPageController?.animateToPage(
            page,
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
