import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TelaMenu extends StatefulWidget {
  @override
  _TelaMenuState createState() => _TelaMenuState();
}

class _TelaMenuState extends State<TelaMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/telamenu.png"),
                    fit: BoxFit.cover)),
          ),
          Center(
            heightFactor: 12,
            child: Column(
              children: <Widget>[
                Container(
                  width: 300,
                  height: 100,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.blue,
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
                                title: Text('Novo Texto',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25)),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Container(
                  width: 300,
                  height: 100,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.purple,
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
                                        color: Colors.white, fontSize: 25)),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Container(
                  width: 300,
                  height: 100,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.pink,
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
                                title: Text('Novo Texto',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25)),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Container(
                  width: 300,
                  height: 100,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.grey,
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
                                title: Text('Novo Texto',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25)),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
