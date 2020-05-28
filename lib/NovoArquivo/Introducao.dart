import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:zefyr/zefyr.dart';

class Introducao extends StatefulWidget {
  @override
  IntroducaoState createState() => IntroducaoState();
}

class IntroducaoState extends State<Introducao> {
  /// Allows to control the editor and the document.
  ZefyrController _controller;

  /// Zefyr editor like any other input field requires a focus node.
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    // Here we must load the document and pass it to Zefyr controller.
    final document = _loadDocument();
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    // Note that the editor requires special `ZefyrScaffold` widget to be
    // one of its parents.
    return Scaffold(
      appBar: AppBar(
        title: Text("Introdução"),
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.save),
              onPressed: () {},
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
                      child: Text("Fechar"), 
                      onPressed: () {
                        Navigator.pop(context);
                      }
                    )
                  ]
                  ).show();
              },
            ),
          )
        ],),
      body: ZefyrScaffold(
        child: ZefyrEditor(
          padding: EdgeInsets.all(16),
          controller: _controller,
          focusNode: _focusNode,
        ),
      ),
    );
  }

  /// Loads the document to be edited in Zefyr.
  NotusDocument _loadDocument() {
    // For simplicity we hardcode a simple document with one line of text
    // saying "Zefyr Quick Start".
    // (Note that delta must always end with newline.)
    final Delta delta = Delta()..insert("Introdução\n");
    return NotusDocument.fromDelta(delta);
  }
}