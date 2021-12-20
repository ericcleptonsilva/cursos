import 'package:cript_moeda/models/moedas.dart';

class MoedasRepository {
  static List<Moedas> tabela = [
    Moedas(
      icon: 'assets/img/btc.png',
      name: "Bitcoin",
      sigla: "BTC",
      preco: 59993.00,
    ),
    Moedas(
      icon: 'assets/img/doge.png',
      name: "Dogecoin",
      sigla: "DOGE",
      preco: 0.23,
    ),
    Moedas(
      icon: 'assets/img/eth.png',
      name: "Ethereum",
      sigla: "ETH",
      preco: 4367.06,
    ),
    Moedas(
      icon: 'assets/img/Lte.png',
      name: "Litecoin",
      sigla: "LTC",
      preco: 4.36,
    ),
    Moedas(
      icon: 'assets/img/monero.png',
      name: "Monero",
      sigla: "XMR",
      preco: 244.64,
    ),
  ];
}
