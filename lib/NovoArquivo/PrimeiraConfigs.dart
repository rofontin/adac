import 'package:flutter/material.dart';

class PrimeiraConfigs extends StatefulWidget {
  @override
  _PrimeiraConfigsState createState() => _PrimeiraConfigsState();
}

class _PrimeiraConfigsState extends State<PrimeiraConfigs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Arquivo"),
        backgroundColor: Color.fromRGBO(18, 32, 45, 1),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.note_add),
                  labelText: 'Nome do Arquivo *',
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.edit),
                  labelText: 'Titulo *',
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.only(top: 330),
              child: FloatingActionButton(
                onPressed: (){
                  Navigator.of(context).pushNamedAndRemoveUntil('/TelaNovoArquivo', (Route<dynamic> route) => false);
                },
                child: Icon(Icons.navigate_next),
                backgroundColor: Color.fromRGBO(18, 32, 45, 1),
              )
            )
          ],
        ),
      )
    );
  }
}