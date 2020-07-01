import 'dart:convert';

import 'package:adac/Banco/BD.dart';
import 'package:adac/Modelos/CorpoArquivo.dart';
import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:zefyr/zefyr.dart';

class Introducao extends StatefulWidget {
  /*
  * Recebe os dados passados da tela anterior
  */
  int idArquivo;
  String introducao;

  Introducao({Key key, this.idArquivo, this.introducao})
      : super(
          key: key,
        );

  @override
  IntroducaoState createState() => IntroducaoState();
}

class IntroducaoState extends State<Introducao> {
  ZefyrController _controller;
  FocusNode _focusNode;
  CorpoArquivo _corpoArquivo = CorpoArquivo();

  DatabaseHelper db = DatabaseHelper();

  /*
  * Inicializa os parametros antes de carregar a tela, chamando
  * o metodo para carregar o documento
  */
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
        title: Text("Introdução"),
        actions: <Widget>[
          /*
          * Botão para salvar o documento
          */
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _corpoArquivo.id = widget.idArquivo;
                _corpoArquivo.idArquivo = widget.idArquivo;
                _corpoArquivo.topico1 = _controller.document.toPlainText();
                db.atualizaCorpoArquivo(_corpoArquivo);

                return Alert(
                    context: context,
                    title: "Salvar Arquivo",
                    desc: "Arquivo salvo com sucesso!",
                    buttons: [
                      DialogButton(
                          child: Text(
                            "Fechar",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ]).show();
              },
            ),
          ),
          /*
          * Botão de ajuda sobre o assunto do topico
          */
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.help),
              onPressed: () {
                return Alert(
                    context: context,
                    title: "Ajuda!",
                    desc:
                        "A introdução é primordial para produzir um conteúdo, pois é essa etapa que "
                        "vai incentivar a leitura completa do texto. Por isso, é importante que a introdução "
                        "seja muito bem escrita e atrativa para que o leitor permaneça no conteúdo até o fim.",
                    buttons: [
                      DialogButton(
                          child: Text(
                            "Fechar",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ]).show();
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

  /*
  * Carrega o documento com o topico passado pelo metodo
  */
  NotusDocument _loadDocument(BuildContext context) {
    final Delta delta = Delta()..insert(widget.introducao + "\n");
    return NotusDocument.fromDelta(delta);
  }
}
