import 'package:adac/Banco/BD.dart';
import 'package:adac/NovoArquivo/MenuArquivo.dart';
import 'package:adac/Modelos/Arquivo.dart';
import 'package:adac/Modelos/CorpoArquivo.dart';
import 'package:flutter/material.dart';

class PrimeiraConfigs extends StatefulWidget {
  final Arquivo arquivo;
  PrimeiraConfigs({this.arquivo});

  @override
  _PrimeiraConfigsState createState() => _PrimeiraConfigsState();
}

class _PrimeiraConfigsState extends State<PrimeiraConfigs> {
  final _nomeController = TextEditingController();
  final _tituloController = TextEditingController();
  final _nomeFocus = FocusNode();
  final _tituloFocus = FocusNode();

  List<Arquivo> arquivos = List<Arquivo>();
  CorpoArquivo _corpoArquivo = CorpoArquivo();

  DatabaseHelper db = DatabaseHelper();

  Arquivo _arquivo;
  int idArquivo;
  String _titulo = "";
  bool existe = false;

  /*
  * Inicialização da página
  */
  @override
  void initState() {
    super.initState();

    if (widget.arquivo == null) {
      _arquivo = Arquivo("");
    } else {
      _arquivo = Arquivo.fromMap(widget.arquivo.toMap());

      _nomeController.text = _arquivo.nome;
    }

    db.retornaArquivos().then((lista) {
      setState(() {
        arquivos = lista;
      });
    });
  }

  /*
  * Metodo para exibir um alert informado que falta 
  * digitar um nome para o arquivo 
  */
  void _exibiAlertaNome() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Atenção!"),
          content: Text("Por Favor, digite um nome ao seu arquivo!"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Fechar"))
          ],
        );
      },
    );
  }

  /*
  * Metodo para exibir um alert informando que está faltando digitar 
  * o titulo para continuar
  */
  void _exibiAlertaTitulo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Atenção!"),
          content: Text("Por Favor, digite um titulo ao seu arquivo!"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Fechar"))
          ],
        );
      },
    );
  }

  /*
  * Metodo para exibir mensagem dizendo que nome de arquivo ja existe
  */
  void _nomeExiste() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Atenção!"),
          content: Text(
              "O nome de arquivo ja existe, por favor, digite outro nome!"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Fechar"))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Novo Arquivo"),
          backgroundColor: Color.fromRGBO(18, 32, 45, 1),
          centerTitle: true,
        ),
        /*
        * Ifs para validações de nome e titulo se estão em branco e
        * validação para verificar se nome ja existe
        */
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_arquivo.nome != null && _arquivo.nome.isNotEmpty) {
              if (_corpoArquivo.titulo != null &&
                  _corpoArquivo.titulo.isNotEmpty) {
                for (Arquivo arquivo in arquivos) {
                  if (_arquivo.nome == arquivo.nome) {
                    existe = true;
                    break;
                  } else {
                    existe = false;
                  }
                }
                if (existe == false) {
                  FutureBuilder(
                      future: _inseriArquivo(_arquivo, _corpoArquivo),
                      builder: (context, snapshot) {
                        if (snapshot.data) {
                          return Center(
                            child: Text(
                              snapshot.data,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      });
                } else {
                  _nomeExiste();
                }
              } else {
                _exibiAlertaTitulo();
                FocusScope.of(context).requestFocus(_tituloFocus);
              }
            } else {
              _exibiAlertaNome();
              FocusScope.of(context).requestFocus(_nomeFocus);
            }
          },
          child: Icon(Icons.navigate_next),
          backgroundColor: Color.fromRGBO(18, 32, 45, 1),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    controller: _nomeController,
                    focusNode: _nomeFocus,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.note_add),
                      labelText: 'Nome do Arquivo *',
                    ),
                    onChanged: (text) {
                      _arquivo.nome = text;
                    },
                  )),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    controller: _tituloController,
                    focusNode: _tituloFocus,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.edit),
                      labelText: 'Titulo *',
                    ),
                    onChanged: (editTitulo) {
                      _titulo = editTitulo;
                      _corpoArquivo.titulo = editTitulo;
                    },
                  )),
            ],
          ),
        ));
  }

  /*
  * Metodo para inserir um novo arquivo e um corpo de arquivo
  */
  _inseriArquivo(Arquivo arquivo, CorpoArquivo corpoArquivo) async {
    var id = await db.inserirArquivo(arquivo, corpoArquivo);
    idArquivo = id;
    _irMenuArquivo();
  }

  /*
  * Metodo para ir a pagina de menu do arquivo passando três variaveis
  * que são a id do arquivo, o titulo e o nome do arquivo
  */
  _irMenuArquivo() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MenuArquivo(
            idArquivo: idArquivo,
            titulo: _titulo,
            nomeArquivo: _arquivo.nome,
          ),
        ));
  }
}
