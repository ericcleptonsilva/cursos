// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_constructors_in_immutables

import 'package:cript_moeda/pages/Favorite_page.dart';
import 'package:cript_moeda/pages/moedas_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pages;
  @override
  void initState() {
    super.initState();
    pages = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pages,
        children: [
          MoedasPage(),
          FavoritePage(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.white,
        currentIndex: paginaAtual,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.house,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favorito',
          ),
        ],
        onTap: (pagina) {
          pages.animateToPage(
            pagina,
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },
        
      ),
    );
  }
}
