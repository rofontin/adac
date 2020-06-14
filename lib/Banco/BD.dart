import 'dart:io';

import 'package:adac/Modelos/Arquivo.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper{

  static DatabaseHelper _databaseHelper;
  static Database _database;

  //Tabela Arquivo
  String arquivoTable = 'arquivo';
  String colId = 'id';
  String colNomeArquivo = 'nomeArquivo';

  //Tabela Corpo do Arquivo
  String corpoArquivoTable = 'corpoArquivo';
  String colCorpoId = 'id';
  String colCorpoTitulo = 'titulo';
  String colTopico1 = 'topico1';
  String colTopico2 = 'topico2';
  String colTopico3 = 'topico3';
  String colTopico4 = 'topico4';
  String colTopico5 = 'topico5';
  String colTopico6 = 'topico6';
  String colEstrangeira = 'idArquivo';

  DatabaseHelper._createInstance();
  
  factory DatabaseHelper(){

    if(_databaseHelper == null){
      _databaseHelper = DatabaseHelper._createInstance();
    }

    return _databaseHelper;
  }

  Future<Database> get database async{

    if(_database == null){
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<Database> initializeDatabase() async{
    
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'adacArquivos.db';

    var bdArquivos = await openDatabase(path, version: 2, onCreate: _createDb);
    return bdArquivos;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $arquivoTable($colId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, $colNomeArquivo VARCHAR(50))');
    await db.execute('CREATE TABLE $corpoArquivoTable($colCorpoId INTEGER PRIMARY KEY AUTOINCREMENT, $colCorpoTitulo VARCHAR(50),$colTopico1 TEXT,'
    '$colTopico2 TEXT,$colTopico3 TEXT,$colTopico4 TEXT,$colTopico5 TEXT,$colTopico6 TEXT, $colEstrangeira INTEGER, FOREIGN KEY ($colEstrangeira) REFERENCES $arquivoTable($colId))');
  }

  Future<int> inserirArquivo(Arquivo arquivo) async {
    Database db = await this.database;

    var resultado = await db.insert(arquivoTable, arquivo.toMap());

    return resultado;
  }

  Future<Arquivo> retornaArquivo(int id) async {
    
    Database db = await this.database;

    List<Map> maps = await db.query(
      arquivoTable,
      columns: [colId,colNomeArquivo],
      where: "$colId = ?",
      whereArgs: [id]
    );

    if(maps.length > 0){
      return Arquivo.fromMap(maps.first);
    }else{
      return null;
    }
  }

  Future<int> atualizaArquivo(Arquivo arquivo) async {

    var db = await this.database;

    var resultado = await db.update(
      arquivoTable,
      arquivo.toMap(),
      where: '$colId = ?',
      whereArgs: [arquivo.id]
    );

    return resultado;
  }

  Future<int> deletarArquivo(int id) async {

    var db = await this.database;

    int resultado = await db.delete(
      arquivoTable,
      where: '$colId = ?',
      whereArgs: [id]
    );

    return resultado;
  }

  Future<List<Arquivo>> retornaArquivos() async{

    Database db = await this.database;

    var resultado = await db.query(arquivoTable);

    List<Arquivo> lista = resultado.isNotEmpty ? resultado.map(
      (c) => Arquivo.fromMap(c)
    ).toList() : [];

    return lista;
  }

  Future close() async {
    
    Database db = await this.database;

    db.close();
  }

}

