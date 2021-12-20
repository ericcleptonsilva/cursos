import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

class DB {
  //constructor com acesso private
  DB._();
  //criar uma intancia DB
  static final DB instance = DB._();

  //Intancia do SQlite
  static Database? _database;

  //Acesso ao banco de dados
  get database async {
    if (_database != null) {
      return _database;
    }
    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'database.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_conta);
    await db.execute(_carteira);
    await db.execute(_historico);
    await db.insert('conta', {'saldo': 0});
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
    CREATE TABLE historico(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      data_operacao INT, 
      tipo_operacao TEXT,
      sigla TEXT,
      moeda TEXT,
      quantidade TEXT,
      valor REAL
    );
  ''';
}
