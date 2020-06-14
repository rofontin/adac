class CorpoArquivo{
  int id;
  String titulo;
  String topico1;
  String topico2;
  String topico3;
  String topico4;
  String topico5;
  String topico6;
  int idArquivo;

  CorpoArquivo(this.id, this.titulo,this.idArquivo);

  Map<String,dynamic> toMap(){

    var map = <String,dynamic> {
      'id':id,
      'nomeArquivo':titulo,
      'topico1':topico1,
      'topico2':topico2,
      'topico3':topico3,
      'topico4':topico4,
      'topico5':topico5,
      'topico6':topico6,
      'idArquivo':idArquivo
    };

    return map;
  }

  CorpoArquivo.fromMap(Map<String,dynamic> map){
    id = map['id'];
    titulo = map['nomeArquivo'];
    topico1 = map['topico1'];
    topico2 = map['topico2'];
    topico3 = map['topico3'];
    topico4 = map['topico4'];
    topico5 = map['topico5'];
    topico6 = map['topico6'];
    idArquivo = map['idArquivo'];
  }
}