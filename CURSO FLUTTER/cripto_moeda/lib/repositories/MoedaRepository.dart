import 'package:cripto_moeda/models/Moedas.dart';

class MoedaRepository {
  static List<Moedas> tabela = [
    Moedas(
      icone: "images/btc.png",
      nome: "BitCoin",
      sigla: "BTC",
      preco: 257781.00,
    ),
    Moedas(
      icone: "images/eth.png",
      nome: "Ethereum",
      sigla: "ETH",
      preco: 19493.00,
    ),
    Moedas(
      icone: "images/doge.png",
      nome: "Dogecoin",
      sigla: "DOGE",
      preco: 1.57,
    ),
  ];
}
