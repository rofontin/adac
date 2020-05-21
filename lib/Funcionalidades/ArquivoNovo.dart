import 'package:flutter/material.dart';

class ArquivoNovo extends StatefulWidget {
  @override
  _ArquivoNovoState createState() => _ArquivoNovoState();
}

class _ArquivoNovoState extends State<ArquivoNovo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter a search term'
        ),
      )
    );
  }
}