import 'package:cript_moeda/models/moedas.dart';
import 'package:hive_flutter/adapters.dart';

class MoedasHiveAdapter extends TypeAdapter<Moedas> {
  @override
  final typeId = 0;
  @override
  Moedas read(BinaryReader reader) {
    return Moedas(
      icon: reader.readString(),
      name: reader.readString(),
      sigla: reader.readString(),
      preco: reader.readDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, Moedas obj) {
    writer.writeString(obj.icon);
    writer.writeString(obj.name);
    writer.writeString(obj.sigla);
    writer.writeDouble(obj.preco);
  }
}
