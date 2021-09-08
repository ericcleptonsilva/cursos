import 'package:cripto_moeda/models/Moedas.dart';
import 'package:hive/hive.dart';

class MoedaHiveAdapater extends TypeAdapter<Moeda> {
  @override
  final typeId = 0;

  @override
  Moeda read(BinaryReader reader) {
    return Moeda(
      icone: reader.readString(),
      nome: reader.readString(),
      sigla: reader.readString(),
      preco: reader.readDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, Moeda moeda) {
    writer.writeString(moeda.icone);
    writer.writeString(moeda.nome);
    writer.writeString(moeda.sigla);
    writer.writeDouble(moeda.preco);
  }
}
