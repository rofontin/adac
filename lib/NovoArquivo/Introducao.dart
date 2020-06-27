import 'package:adac/Banco/BD.dart';
import 'package:adac/Modelos/CorpoArquivo.dart';
import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:zefyr/zefyr.dart';

class Introducao extends StatefulWidget {

  int idArquivo;
  String introducao;

  Introducao({Key key, this.idArquivo,this.introducao}) : super(key: key,);

  @override
  IntroducaoState createState() => IntroducaoState();
}

class IntroducaoState extends State<Introducao> {

  ZefyrController _controller;
  FocusNode _focusNode;
  CorpoArquivo _corpoArquivo = CorpoArquivo();

  DatabaseHelper db = DatabaseHelper();

  String introducao = "Parágrafo – um texto pode ser formado por diversos parágrafos, "+
  "apresentado de acordo com o grupo de idéias. O parágrafo é composto de frases, "+
  "é uma mudança de linha. Frase é expressa sentido. As frases podem ser: interrogativas, "+
  "afirmativas, negativas, exclamativas e imperativas."+
  "Fatores na construção do texto – o texto enseja coerência, trabalhar com coesão."+
  "A coerência é um fator importante para a estruturação do texto, no ponto em que não se "+
  "podem contradizer as outras partes do texto. Na verdade o texto deve ser coerente em um todo."+
  "A coesão é uma conexão interna entre as várias partes de um texto. A melhor forma de usar"+
  "esta ferramenta e dispor de forma correta o uso da gramática."+
  "Organização dos textos – primeiro buscar uma finalidade, depois decidir sobre uma sequência."+
  "As sequências dividem-se em: narrativas, descritivas, dissertativas, instrutivas e com diálogos.";

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
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _corpoArquivo.id = widget.idArquivo;
                _corpoArquivo.idArquivo = widget.idArquivo;
                _corpoArquivo.topico1 = introducao;
                db.atualizaCorpoArquivo(_corpoArquivo);
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

  NotusDocument _loadDocument(BuildContext context) {
    final Delta delta = Delta()..insert(widget.introducao+"\n");
    return NotusDocument.fromDelta(delta);
  }
}