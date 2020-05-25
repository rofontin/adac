import 'package:flutter/material.dart';

class MenuArquivo extends StatefulWidget {
  @override
  _MenuArquivoState createState() => _MenuArquivoState();
}

class _MenuArquivoState extends State<MenuArquivo> {
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