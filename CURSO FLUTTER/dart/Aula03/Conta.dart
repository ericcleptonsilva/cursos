import 'Cartao.dart';
import 'Cliente.dart';
import 'Fatura.dart';

class Conta {
  Cliente cliente;
  Cartao cartao;
  List<Fatura> fatura;

  Conta({
    required this.fatura,
    required this.cartao,
    required this.cliente,
  });
}
