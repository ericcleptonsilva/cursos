import 'Comprar.dart';

class Fatura {
  List<Comprar> compras;
  int mes;
  int ano;

  Fatura({
    required this.compras,
    required this.ano,
    required this.mes,
  });
}
