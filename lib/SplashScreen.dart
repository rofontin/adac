import 'dart:async';

import 'package:adac/TelaLogin.dart';
import 'package:flutter/material.dart';

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
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => SignInDemo()
      )
    );
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