import 'package:cripto_moeda/models/Moedas.dart';

class MoedaRepository {
  static List<Moeda> tabela = [
    Moeda(
      icone: "images/btc.png",
      nome: "Bitcoin",
      sigla: "BTC",
      preco: 257781.00,
    ),
    Moeda(
      icone: "images/eth.png",
      nome: "Ethereum",
      sigla: "ETH",
      preco: 19493.00,
    ),
    Moeda(
      icone: "images/doge.png",
      nome: "Dogecoin",
      sigla: "DOGE",
      preco: 1.57,
    ),
  ];
}
