import 'package:adac/Banco/BD.dart';
import 'package:adac/Modelos/CorpoArquivo.dart';
import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:zefyr/zefyr.dart';

class Introducao extends StatefulWidget {

  final int idArquivo;

  Introducao({Key key, this.idArquivo}) : super(key: key,);

  @override
  IntroducaoState createState() => IntroducaoState();
}

class IntroducaoState extends State<Introducao> {

  CorpoArquivo _corpoArquivo;

  ZefyrController _controller;
  FocusNode _focusNode;
  DatabaseHelper db = DatabaseHelper();
  List<CorpoArquivo> topicos = List<CorpoArquivo>();

  @override
  void initState() {
    super.initState();
    
    _corpoArquivo = CorpoArquivo(widget.idArquivo);
    _corpoArquivo.topico1 = 'Introdução teste 1';
    List<CorpoArquivo> topicos;

    final document = _loadDocument(topicos);
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Introdução"),
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                print(_corpoArquivo.idArquivo);
                _inseriIntroducao(_corpoArquivo);
              },
            ),
          ),
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.help),
              onPressed: () {
                return Alert(
                  context: context, 
                  title: "Ajuda!",
                  desc: "A introdução é primordial para produzir um conteúdo, pois é essa etapa que "
                  "vai incentivar a leitura completa do texto. Por isso, é importante que a introdução "
                  "seja muito bem escrita e atrativa para que o leitor permaneça no conteúdo até o fim.",
                  buttons: [
                    DialogButton(
                      child: Text("Fechar",style: TextStyle(color: Colors.white,fontSize: 25),), 
                      onPressed: () {
                        Navigator.pop(context);
                      }
                    )
                  ]
                  ).show();
              },
            ),
          )
        ],
      ),
      body: ZefyrScaffold(
        child: ZefyrEditor(
          padding: EdgeInsets.all(16),
          controller: _controller,
          focusNode: _focusNode,
        ),
      ),
    );
  }

  NotusDocument _loadDocument(List<CorpoArquivo> topicos) {
    final Delta delta = Delta()..insert(topicos[4].topico1);
    return NotusDocument.fromDelta(delta);
  }

  void _inseriIntroducao(CorpoArquivo corpoArquivo) async{
      await db.inserirCorpo(corpoArquivo);
  }
}