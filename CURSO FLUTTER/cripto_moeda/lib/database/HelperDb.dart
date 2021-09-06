import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class HelperDb {
  //Construtor com acesso privado
  HelperDb._();
  //Criar uma esancia de HelperDb
  static final HelperDb instanciaHelperDb = HelperDb._();
  //Criar a instancia SQlite
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDAtabase();
  }

  _initDAtabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'cripto.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(_database, versao) async {
    await _database.execute(_conta);
    await _database.execute(_carteira);
    await _database.execute(_historico);
    await _database.insert('conta', {'saldo': 0});
  }

  String get _conta => '''
  CREATE TABLE conta (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    saldo REAL
  );

  ''';
  String get _carteira => '''
  CREATE TABLE carteira(
    sigla TEXT PRIMARY KEY,
    moeda TEXT,
    quantidade TEXT
  );


  ''';

  String get _historico => '''
  CREATE TABLE historico (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    data_operaca TEXT,
    tipo_operaca TEXT,
    moeda TEXT,
    sigla TEXT,
    valor REAL,
    quantidade TEXT
  );

  ''';
}
