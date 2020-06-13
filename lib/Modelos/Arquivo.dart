class Arquivo{
  int id;
  String nome;

  Arquivo(this.id, this.nome);

  Map<String,dynamic> toMap(){

    var map = <String,dynamic> {
      'id':id,
      'nomeArquivo':nome
    };

    return map;
  }

  Arquivo.fromMap(Map<String,dynamic> map){
    id = map['id'];
    nome = map['nomeArquivo'];
  }
}