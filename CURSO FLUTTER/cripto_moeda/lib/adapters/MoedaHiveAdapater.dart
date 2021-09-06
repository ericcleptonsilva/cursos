import 'package:cripto_moeda/models/Moedas.dart';
import 'package:hive/hive.dart';

class MoedaHiveAdapater extends TypeAdapter<Moedas> {
  @override
  final typeId = 0;

  @override
  Moedas read(BinaryReader reader) {
    return Moedas(
      icone: reader.readString(),
      nome: reader.readString(),
      sigla: reader.readString(),
      preco: reader.readDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, Moedas moeda) {
    writer.writeString(moeda.icone);
    writer.writeString(moeda.nome);
    writer.writeString(moeda.sigla);
    writer.writeDouble(moeda.preco);
  }
}
