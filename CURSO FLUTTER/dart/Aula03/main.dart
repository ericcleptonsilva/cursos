import 'Cartao.dart';
import 'Cliente.dart';
import 'Comprar.dart';
import 'Conta.dart';
import 'Fatura.dart';

main(List<String> args) {
  var conta = Conta(
    cliente: Cliente(
      id: '0123',
      cpf: '000.123.555-20',
      nome: 'Eric',
      sobrenome: 'Silva',
    ),
    cartao: Cartao(
      limite: 123000,
      numero: '111222333444',
      mes: 08,
      ano: 2025,
      codigo: 123,
    ),
    fatura: [
      Fatura(
        compras: [
          Comprar(
            valor: 5.0,
            descricao: 'café',
            data: '12/08',
          ),
          Comprar(
            valor: 2.00,
            descricao: 'Biscoito',
            data: '12/08',
          )
        ],
        ano: 2021,
        mes: 08,
      ),
      Fatura(
        compras: [
          Comprar(
            valor: 120.00,
            descricao: 'tenis',
            data: '15/07',
          )
        ],
        ano: 2021,
        mes: 07,
      )
    ],
  );
}
