import 'package:adac/Banco/BD.dart';
import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

class ArquivoTodo extends StatefulWidget {
  /*
  * Recebe os dados passados da tela anterior
  */
  int idArquivo;
  String titulo;
  String top1;
  String top2;
  String top3;
  String top4;
  String top5;
  String top6;

  ArquivoTodo({
    Key key,
    this.idArquivo,
    this.titulo,
    this.top1,
    this.top2,
    this.top3,
    this.top4,
    this.top5,
    this.top6,
  }) : super(
          key: key,
        );

  @override
  ArquivoTodoState createState() => ArquivoTodoState();
}

class ArquivoTodoState extends State<ArquivoTodo> {
  ZefyrController _controller;
  FocusNode _focusNode;

  DatabaseHelper db = DatabaseHelper();

  /*
  * Inicializa os parametros antes de carregar a tela, chamando
  * o metodo para carregar o documento
  */
  @override
  void initState() {
    super.initState();

    String all = widget.titulo;

    final document = _loadDocument(context, all);
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

  /*
  * Carrega o documento com o topico passado pelo metodo
  */
  NotusDocument _loadDocument(BuildContext context, String all) {
    final Delta delta = Delta()..insert(all + "\n");
    return NotusDocument.fromDelta(delta);
  }
}
