import 'package:adac/Entrada/TelaEntrada.dart';
import 'package:adac/Entrada/TelaMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'Funcionalidades/MenuArquivo.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: SplashScreen(),
    routes: <String,WidgetBuilder>{
      '/TelaLogin': (BuildContext context) => TelaEntrada(),
      '/TelaMenu': (BuildContext context) => TelaMenu(),
      '/TelaNovoArquivo': (BuildContext context) => MenuArquivo()
    },
    debugShowCheckedModeBanner: false,
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
    super.initState();
    Timer(Duration(seconds: 4), () => _abrirTela());
  }

  void _abrirTela(){
    Navigator.of(context).pushNamedAndRemoveUntil('/TelaLogin', (Route<dynamic> route) => false);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/telainicial.png"),
                fit: BoxFit.cover
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 610,left: 160),
            child: Container(
              child: CircularProgressIndicator(
                  strokeWidth: 3,
              ),
            ),
          )
        ],
      )
    );
  }
}