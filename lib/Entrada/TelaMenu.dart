import 'package:adac/Continuar/TelaContinuar.dart';
import 'package:adac/NovoArquivo/PrimeiraConfigs.dart';
import 'package:flutter/material.dart';
import 'package:adac/Modelos/CardModel.dart';

class TelaMenu extends StatefulWidget {
  @override
  _TelaMenuState createState() => new _TelaMenuState();
}

class _TelaMenuState extends State<TelaMenu> with TickerProviderStateMixin{

  //funcoes para os cards do menu
  void _abrirArquivoNovo(id){
    if(id == 1){
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => PrimeiraConfigs()
        )
      );
    }else if(id == 2){
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => TelaContinuar()
        )
      );
    }else if(id == 3){
      /*Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => PrimeiraConfigs()
        )
      );*/
    }else if(id == 4){
      /*Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => PrimeiraConfigs()
        )
      );*/
    }
  }

  var appColors = [Color.fromRGBO(231, 129, 109, 1.0),Color.fromRGBO(99, 138, 223, 1.0),Color.fromRGBO(111, 194, 173, 1.0),Color.fromRGBO(231, 129, 109, 1.0)];
  var cardIndex = 0;
  ScrollController scrollController;
  var currentColor = Color.fromRGBO(231, 129, 109, 1.0);

  var cardsList = [CardItemModel("Novo Texto", Icons.note_add,1),CardItemModel("Continuar", Icons.edit,2),CardItemModel("Selecionar Arquivo", Icons.cloud_upload,3),CardItemModel("Configurações", Icons.settings,4)];

  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }

  //renderiza todos os cards do menu
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(18, 32, 45, 1),
        title: new Text("ADAC", style: TextStyle(fontSize: 25.0),),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.person_pin, size: 35),
                onPressed: () {},
              ),
            ),
          )
        ]
      ),
      body: new Stack(
        fit: StackFit.expand,
        children:<Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/telamenu.png"),
              fit: BoxFit.cover
            )
          ),
        ),
        SingleChildScrollView(
          child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 600.0,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, position) {
                      return GestureDetector(
                        onTap: () {
                          _abrirArquivoNovo(cardsList[position].id);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top:280.0,left: 10,right: 15),
                          child: Card(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                            child: Container(
                              width: 290.0,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 70, left: 97),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Icon(cardsList[position].icon, color: Colors.white,size: 100),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(30),
                                          child: Text("${cardsList[position].cardTitle}",
                                          textAlign: TextAlign.center ,style: TextStyle(fontSize: 30.0,color: Colors.white),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)
                            ),
                          ),
                        ),
                        onHorizontalDragEnd: (details) {
                          animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
                          
                          if(details.velocity.pixelsPerSecond.dx > 0) {
                            if(cardIndex>0) {
                              cardIndex--;
                            }
                          }else {
                            if(cardIndex<4) {
                              cardIndex++;
                            }
                          }
                          setState(() {
                            scrollController.animateTo((cardIndex)*320.0, duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
                          });

                          animationController.forward( );
                        },
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
        ),
        ]
      ),
    );
  }
}