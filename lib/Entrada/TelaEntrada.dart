import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class TelaEntrada extends StatefulWidget {
  @override
  _TelaEntradaState createState() => _TelaEntradaState();
}

class _TelaEntradaState extends State<TelaEntrada> {

  final RoundedLoadingButtonController _btnController = new RoundedLoadingButtonController();

  void _abrirMenu(){
    Navigator.of(context).pushNamedAndRemoveUntil('/TelaMenu', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/telainicial.png",
          fit: BoxFit.cover,
          height: 1000.0,
          width: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 60.0),
                  child: RoundedLoadingButton(
                    child: Text(
                    'Entrar', 
                    style: TextStyle(
                      color: Colors.white
                    )
                    ),
                    onPressed: _abrirMenu,
                  )
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}