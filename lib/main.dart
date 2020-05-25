import 'package:adac/Entrada/SplashScreen.dart';
import 'package:adac/Entrada/TelaLogin.dart';
import 'package:adac/Entrada/TelaMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Funcionalidades/MenuArquivo.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: SplashScreen(),
    routes: <String,WidgetBuilder>{
      '/TelaLogin': (BuildContext context) => SignInDemo(),
      '/TelaMenu': (BuildContext context) => TelaMenu(),
      '/TelaNovoArquivo': (BuildContext context) => MenuArquivo()
    },
    debugShowCheckedModeBanner: false,
  ));
}