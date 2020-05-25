import 'package:adac/Funcionalidades/MenuArquivo.dart';
import 'package:flutter/material.dart';

class TelaMenu extends StatefulWidget {
  @override
  _TelaMenuState createState() => _TelaMenuState();
}

class _TelaMenuState extends State<TelaMenu> {

  void _abrirArquivoNovo(){
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => MenuArquivo()
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
                      image: AssetImage("images/telamenu.png"),
                      fit: BoxFit.cover)),
            ),
            Center(
              heightFactor: 12,
              child: ListView(
                padding: EdgeInsets.only(top: 16.0,left: 16.0, right: 16.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 120),
                    child: Container(
                      width: 300,
                      height: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Color.fromRGBO(31, 16, 79, 1),
                        child: InkWell(
                            splashColor: Colors.white.withAlpha(100),
                            onTap: _abrirArquivoNovo,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: const ListTile(
                                    leading: Icon(
                                      Icons.add_circle,
                                      size: 70,
                                      color: Colors.white,
                                    ),
                                    title: Text('Novo Texto',
                                        style: TextStyle(
                                            color: Colors.white, 
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold
                                            )),
                                    ),
                                  )
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
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Color.fromRGBO(36, 17, 120, 1),
                        child: InkWell(
                            splashColor: Colors.white.withAlpha(100),
                            onTap: () {},
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    leading: Icon(
                                      Icons.cloud_download,
                                      size: 70,
                                      color: Colors.white,
                                    ),
                                    title: Text('Selecionar Arquivo',
                                        style: TextStyle(
                                            color: Colors.white, 
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
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
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Color.fromRGBO(37, 16, 163, 1),
                        child: InkWell(
                            splashColor: Colors.white.withAlpha(100),
                            onTap: () {},
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    leading: Icon(
                                      Icons.add_circle,
                                      size: 70,
                                      color: Colors.white,
                                    ),
                                    title: Text('Continuar',
                                        style: TextStyle(
                                            color: Colors.white, 
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
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
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Color.fromRGBO(30, 11, 208, 1),
                        child: InkWell(
                            splashColor: Colors.white.withAlpha(100),
                            onTap: () {},
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    leading: Icon(
                                      Icons.settings,
                                      size: 70,
                                      color: Colors.white,
                                    ),
                                    title: Text('Configurações',
                                        style: TextStyle(
                                            color: Colors.white, 
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
