class CorpoArquivo{
  int id;
  String titulo;
  String topico1 = "Introdução";
  String topico2 = "Fundamentação Teorica";
  String topico3 = "Metodologia";
  String topico4 = "Apresentação dos Resultados";
  String topico5 = "Considerações Finais";
  String topico6 = "Referências Bibliográficas"; 
  int idArquivo;

  CorpoArquivo();

  Map<String,dynamic> toMap(){

    var map = <String,dynamic> {
      'id':id,
      'titulo':titulo,
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