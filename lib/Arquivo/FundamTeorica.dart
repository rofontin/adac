import 'package:adac/Banco/BD.dart';
import 'package:adac/Modelos/CorpoArquivo.dart';
import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:zefyr/zefyr.dart';

class FundTeori extends StatefulWidget {

  int idArquivo;
  String fundamentacao;

  FundTeori({Key key, this.idArquivo,this.fundamentacao}) : super(key: key,);

  @override
  FundTeoriState createState() => FundTeoriState();
}

class FundTeoriState extends State<FundTeori> {

  ZefyrController _controller;
  FocusNode _focusNode;
  CorpoArquivo _corpoArquivo = CorpoArquivo();

  DatabaseHelper db = DatabaseHelper();

  @override
  void initState() {
    super.initState();

    final document = _loadDocument(context);
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fundamentação Teorica"),
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _corpoArquivo.id = widget.idArquivo;
                _corpoArquivo.idArquivo = widget.idArquivo;
                _corpoArquivo.topico2 = _controller.document.toPlainText();
                db.atualizaCorpoArquivo(_corpoArquivo);

                return Alert(
                  context: context, 
                  title: "Salvar Arquivo",
                  desc: "Arquivo salvo com sucesso!",
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
          ),
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.help),
              onPressed: () {
                return Alert(
                  context: context, 
                  title: "Ajuda!",
                  desc: "A fundamentação teórica consiste em embasar por meio das ideias " +
                  "de outros autores aspectos teóricos de sua pesquisa.",
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

  NotusDocument _loadDocument(BuildContext context) {
    final Delta delta = Delta()..insert(widget.fundamentacao+"\n");
    return NotusDocument.fromDelta(delta);
  }
}