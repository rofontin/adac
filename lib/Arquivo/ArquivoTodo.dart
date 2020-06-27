import 'package:adac/Banco/BD.dart';
import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

class ArquivoTodo extends StatefulWidget {

  int idArquivo;
  String titulo;
  String top1;
  String top2;
  String top3;
  String top4;
  String top5;
  String top6;

  ArquivoTodo(
    {
      Key key, 
      this.idArquivo,
      this.titulo,
      this.top1,
      this.top2,
      this.top3,
      this.top4,
      this.top5,
      this.top6,
    }
  ) : super(key: key,);

  @override
  ArquivoTodoState createState() => ArquivoTodoState();
}

class ArquivoTodoState extends State<ArquivoTodo> {

  ZefyrController _controller;
  FocusNode _focusNode;

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
        title: Text("Arquivo"),
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
    final Delta delta = Delta()..insert(
      widget.titulo + "\n\n" +
      widget.top1 + "\n\n" +
      widget.top2 + "\n\n" +
      widget.top3 + "\n\n" +
      widget.top4 + "\n\n" +
      widget.top5 + "\n\n" +
      widget.top6 + "\n\n" 
    );
    return NotusDocument.fromDelta(delta);
  }
}