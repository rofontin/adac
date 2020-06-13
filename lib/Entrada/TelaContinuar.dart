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

    /*Arquivo arq = Arquivo(4,"João e Maria");
    db.inserirArquivo(arq);
    Arquivo arq1 = Arquivo(2,"A lenda do tesouro perdido");
    db.inserirArquivo(arq1);
    Arquivo arq2 = Arquivo(3,"Bananas de Pijamas");
    db.inserirArquivo(arq2);

    db.retornaArquivos().then((lista){
      print(lista);
    });*/

    db.retornaArquivos().then((lista){
      setState(() {
        arquivos = lista;
      });

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
        itemCount: arquivos.length,
        itemBuilder: (context, index) {
          return _listaArquivos(context,index);
        }
      ),
    );
  }

   _listaArquivos(BuildContext context,int index){

     return GestureDetector(
       child: Card(
         child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        arquivos[index].nome ?? "",
                        style: TextStyle(
                          fontSize: 20
                        )
                      )
                    ]
                  ),
                )
              ],
            ),
         ),
         
       ),
     );

   }
}