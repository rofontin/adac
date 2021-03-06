import 'package:adac/Banco/BD.dart';
import 'package:adac/Continuar/Continuar.dart';
import 'package:adac/Modelos/Arquivo.dart';
import 'package:flutter/material.dart';

class TelaContinuar extends StatefulWidget {
  @override
  _TelaContinuarState createState() => _TelaContinuarState();
}

class _TelaContinuarState extends State<TelaContinuar> {

  DatabaseHelper db = DatabaseHelper();
  List<Arquivo> arquivos = List<Arquivo>();
  
  // inicializa tela com arquivos salvos
  @override
  void initState() {
    super.initState();

    _exibiArquivos();
  }

  void _exibiArquivos(){
    db.retornaArquivos().then((lista){
      setState(() {
        arquivos = lista;
      });
    });
  }
  // disponibiliza as funcoes para os arquivos serem excluidos ou acessados
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
                ),
              ],
            ),
         ),
       ),
       onLongPress: (){
         _confirmaExclusao(context,arquivos[index].id,index);
       },
       onTap: (){
         _continuar(index);
       }
     );
   }

   void _continuar(index){
     Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => ContinuarArquivo(idArquivo: arquivos[index].id,nomeArquivo: arquivos[index].nome,),
      )
    );
   }

   void _confirmaExclusao(BuildContext context, int idArquivo, index){
     showDialog(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(
           title: Text("Excluir Arquivo"),
           content: Text("Deseja realmente excluir este arquivo?"),
           actions: <Widget>[
             FlatButton(
               onPressed: (){
                 Navigator.of(context).pop();
               }, 
               child: Text("Cancelar")
              ),
              FlatButton(
               onPressed: (){
                 arquivos.removeAt(index);
                 db.deletarArquivo(idArquivo);
                 _exibiArquivos();
                 Navigator.of(context).pop();
               }, 
               child: Text("Confirmar")
              )
           ],
         );
        },
      );
   }
}