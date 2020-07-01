// modelo banco para CRUD do arquivo
class Arquivo{
  int id;
  String nome;

  Arquivo(this.nome);

  Map<String,dynamic> toMap(){

    var map = <String,dynamic> {
      'id':id,
      'nomeArquivo':nome
    };

    return map;
  }

  Arquivo.fromMap(Map<String,dynamic> map){
    this.id = map['id'];
    this.nome = map['nomeArquivo'];
  }

  getNome(){
    return this.nome;
  }
}