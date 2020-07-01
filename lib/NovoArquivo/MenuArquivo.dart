import 'package:adac/Banco/BD.dart';
import 'package:adac/Modelos/CorpoArquivo.dart';
import 'package:adac/Arquivo/ApresResultados.dart';
import 'package:adac/Arquivo/ConsiderFinais.dart';
import 'package:adac/Arquivo/FundamTeorica.dart';
import 'package:adac/Arquivo/Metodologia.dart';
import 'package:adac/Arquivo/RefBibliograficas.dart';
import 'package:flutter/material.dart';
import 'package:adac/Arquivo/Introducao.dart';

class MenuArquivo extends StatefulWidget {
  /*
  * Recebe as variaveis da tela anterior para serem utilizadas 
  */
  MenuArquivo({Key key, this.idArquivo, this.titulo, this.nomeArquivo})
      : super(key: key);

  final int idArquivo;
  final String nomeArquivo;
  final String titulo;

  @override
  _MenuArquivoState createState() => _MenuArquivoState();
}

class _MenuArquivoState extends State<MenuArquivo> {
  List<CorpoArquivo> corpo = List<CorpoArquivo>();
  DatabaseHelper db = DatabaseHelper();

  String _nome;

  /*
  * Passa pelo initState antes de carregar a tela
  */
  @override
  void initState() {
    super.initState();

    _nome = widget.nomeArquivo;

    db.retornaCorpoArquivo(widget.idArquivo).then((lista) {
      setState(() {
        this.corpo = lista;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(18, 32, 45, 1),
        title: new Text(
          _nome,
          style: TextStyle(fontSize: 25.0),
        ),
        centerTitle: true,
      ),
      body: Container(
        /*
        * Inseri uma imagem de fundo na tela
        */
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/telainicial.png"),
                      fit: BoxFit.fill)),
            ),
            /*
            * Monta varios botões com os topicos de um arquivo, a partir deste
            * botão repassa os dados para a próxima tela.
            */
            Center(
              heightFactor: 12,
              child: ListView(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      width: 300,
                      height: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        child: InkWell(
                            splashColor: Colors.white.withAlpha(100),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Introducao(
                                            idArquivo: corpo[0].idArquivo,
                                            introducao: corpo[0].topico1,
                                          )));
                            },
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    title: Text('1. Introdução',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25)),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Container(
                      width: 300,
                      height: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        child: InkWell(
                            splashColor: Colors.white.withAlpha(100),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FundTeori()));
                            },
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    title: Text('2. Fundamentação Teórica',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25)),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Container(
                      width: 300,
                      height: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        child: InkWell(
                            splashColor: Colors.white.withAlpha(100),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Metodolog()));
                            },
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    title: Text('3. Metodologia',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25)),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Container(
                      width: 300,
                      height: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        child: InkWell(
                            splashColor: Colors.white.withAlpha(100),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Resultados()));
                            },
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    title: Text(
                                        '4. Apresentação dos Resultados',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25)),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Container(
                      width: 300,
                      height: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        child: InkWell(
                            splashColor: Colors.white.withAlpha(100),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ConsFinais()));
                            },
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    title: Text('5. Considerações Finais',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25)),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 40),
                    child: Container(
                      width: 300,
                      height: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        child: InkWell(
                            splashColor: Colors.white.withAlpha(100),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RefBiblio()));
                            },
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    title: Text('6. Referências Bibliográficas',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25)),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
