import 'dart:io';

import 'package:adac/Modelos/Arquivo.dart';
import 'package:adac/Modelos/CorpoArquivo.dart';
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
  
  /*
   * Cria uma instancia de um banco de dados
   */
  factory DatabaseHelper(){

    if(_databaseHelper == null){
      _databaseHelper = DatabaseHelper._createInstance();
    }

    return _databaseHelper;
  }

  /*
   * retorna o banco de dados
   */
  Future<Database> get database async{

    if(_database == null){
      _database = await initializeDatabase();
    }

    return _database;
  }

  /*
   * Inicializa o banco de dados
   */
  Future<Database> initializeDatabase() async{
    
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'adacArquivos.db';

    var bdArquivos = await openDatabase(path, version: 2, onCreate: _createDb);
    return bdArquivos;
  }

  /*
   * Cria as tabelas do banco de dados
   */
  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $arquivoTable($colId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, $colNomeArquivo VARCHAR(50))');
    await db.execute('CREATE TABLE $corpoArquivoTable($colCorpoId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, $colCorpoTitulo VARCHAR(50),$colTopico1 TEXT,'
    '$colTopico2 TEXT,$colTopico3 TEXT,$colTopico4 TEXT,$colTopico5 TEXT,$colTopico6 TEXT, $colEstrangeira INTEGER, FOREIGN KEY ($colEstrangeira) REFERENCES $arquivoTable($colId))');
  }

  /*
   * Inseri um arquivo
   */
  Future<int>inserirArquivo(Arquivo arquivo,CorpoArquivo corpo) async {
    Database db = await this.database;

    var resultado = await db.insert(arquivoTable, arquivo.toMap());
    corpo.id = resultado;
    corpo.idArquivo = resultado;
    await db.insert(corpoArquivoTable, corpo.toMap());

    return resultado;
  }

  /*
   * Inseri o corpo de um arquivo
   
  Future<int> inserirCorpo(CorpoArquivo corpoArquivo) async {
    Database db = await this.database;

    

 
  }*/

  /*
   * Retorna arquivo pelo nome
   */
  retornaArquivo(String nome) async {
    
    Database db = await this.database;

    var maps = await db.query(
      arquivoTable,
      columns: [colId,colNomeArquivo],
      where: "$colNomeArquivo = ?",
      whereArgs: [nome]
    );

    if(maps.length > 0){
      return Arquivo.fromMap(maps.first);
    }else{
      return null;
    }

  }

  /*
   * Retorna o corpo de um arquivo
   */
  retornaCorpoArquivo(int idArquivo) async{
    
    Database db = await this.database;

    var maps = await db.query(
      corpoArquivoTable,
      columns: [colCorpoId,colCorpoTitulo,colTopico1,colTopico2,colTopico3,colTopico4,colTopico5,colTopico6,colEstrangeira],
      where: "$colEstrangeira = ?",
      whereArgs: [idArquivo]
    );

    List<CorpoArquivo> lista = maps.isNotEmpty ? maps.map(
      (c) => CorpoArquivo.fromMap(c)
    ).toList() : [];

    return lista;

  }

  /*
   * Atualiza um arquivo
   */
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

  /*
   * Atualiza o corpo de um arquivo
   */
  Future<int> atualizaCorpoArquivo(CorpoArquivo corpoArquivo) async {

    var db = await this.database;

    var resultado = await db.update(
      corpoArquivoTable,
      corpoArquivo.toMap(),
      where: '$colEstrangeira = ?',
      whereArgs: [corpoArquivo.idArquivo]
    );

    return resultado;
  }

  /*
   * Deleta um arquivo por id
   */
  Future<int> deletarArquivo(int id) async {

    var db = await this.database;

    int resultado = await db.delete(
      arquivoTable,
      where: '$colId = ?',
      whereArgs: [id]
    );

    return resultado;
  }

  /*
   * Retorna lista de arquivos
   */
  Future<List<Arquivo>> retornaArquivos() async{

    Database db = await this.database;

    var resultado = await db.query(arquivoTable);

    List<Arquivo> lista = resultado.isNotEmpty ? resultado.map(
      (c) => Arquivo.fromMap(c)
    ).toList() : [];

    return lista;
  }

  /*
   * Fecha banco de dados
   */
  Future close() async {
    
    Database db = await this.database;

    db.close();
  }

}

