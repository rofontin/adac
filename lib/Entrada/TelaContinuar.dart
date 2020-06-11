import 'package:adac/Banco/BD.dart';
import 'package:adac/Modelos/Arquivo.dart';
import 'package:flutter/material.dart';

class TelaContinuar extends StatefulWidget {
  @override
  _TelaContinuarState createState() => _TelaContinuarState();
}

class _TelaContinuarState extends State<TelaContinuar> {

  DatabaseHelper db = DatabaseHelper();
  List<Arquivo> arquivos = List<Arquivo>();

  @override
  void initState() {
    super.initState();

    Arquivo arq = Arquivo(1,"João e Maria");
    db.inserirArquivo(arq);
    Arquivo arq1 = Arquivo(2,"A lenda do tesouro perdido");
    db.inserirArquivo(arq1);
    Arquivo arq2 = Arquivo(3,"Bananas de Pijamas");
    db.inserirArquivo(arq2);

    db.retornaArquivos().then((lista){
      print(lista);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arquivos"),
        backgroundColor: Color.fromRGBO(18, 32, 45, 1),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 0,
        itemBuilder: (context, index) {

        }
      ),
    );
  }
}