import 'package:adac/Banco/BD.dart';
import 'package:adac/Modelos/CorpoArquivo.dart';
import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:zefyr/zefyr.dart';

class ConsFinais extends StatefulWidget {

  int idArquivo;
  String consFinais;

  ConsFinais({Key key, this.idArquivo,this.consFinais}) : super(key: key,);

  @override
  ConsFinaisState createState() => ConsFinaisState();
}

class ConsFinaisState extends State<ConsFinais> {

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
        title: Text("Considerações Finais"),
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _corpoArquivo.id = widget.idArquivo;
                _corpoArquivo.idArquivo = widget.idArquivo;
                _corpoArquivo.topico5 = _controller.document.toPlainText();
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
                  desc: "",
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
    final Delta delta = Delta()..insert(widget.consFinais + "\n");
    return NotusDocument.fromDelta(delta);
  }
}