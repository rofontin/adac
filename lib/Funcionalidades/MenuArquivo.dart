import 'package:flutter/material.dart';
import 'package:adac/NovoArquivo/Introducao.dart';

class MenuArquivo extends StatefulWidget {
  @override
  _MenuArquivoState createState() => _MenuArquivoState();
}

class _MenuArquivoState extends State<MenuArquivo> {

  void _abrirIntroducao(){
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => Introducao()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/telamenu1.png"),
                      fit: BoxFit.cover)),
            ),
            Center(
              heightFactor: 12,
              child: ListView(
                padding: EdgeInsets.only(top: 16.0,left: 16.0, right: 16.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 100),
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
                            onTap: _abrirIntroducao,
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
                            onTap: () {},
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
                            onTap: () {},
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
                            onTap: () {},
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    title: Text('4. Apresentação dos Resultados',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25)),
                                  ),
                                ],
                              ),
                            )
                        ),
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
                            onTap: _abrirIntroducao,
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
                            onTap: _abrirIntroducao,
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
