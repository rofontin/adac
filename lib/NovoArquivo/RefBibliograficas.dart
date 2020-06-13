import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:zefyr/zefyr.dart';

class RefBiblio extends StatefulWidget {
  @override
  RefBiblioState createState() => RefBiblioState();
}

class RefBiblioState extends State<RefBiblio> {

  ZefyrController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    
    final document = _loadDocument();
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Referencias Bibliograficas"),
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

  NotusDocument _loadDocument() {
    final Delta delta = Delta()..insert('Referencias Bibliograficas\n');
    return NotusDocument.fromDelta(delta);
  }
}