import 'package:adac/Banco/BD.dart';
import 'package:adac/Modelos/CorpoArquivo.dart';
import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:zefyr/zefyr.dart';

class Resultados extends StatefulWidget {
  /*
  * Recebe os dados passados da tela anterior
  */
  int idArquivo;
  String resultados;

  Resultados({Key key, this.idArquivo, this.resultados})
      : super(
          key: key,
        );

  @override
  ResultadosState createState() => ResultadosState();
}

class ResultadosState extends State<Resultados> {
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
        title: Text("Apresentação dos Resultados"),
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
                _corpoArquivo.topico4 = _controller.document.toPlainText();
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
                    desc: "",
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
    final Delta delta = Delta()..insert(widget.resultados + "\n");
    return NotusDocument.fromDelta(delta);
  }
}
