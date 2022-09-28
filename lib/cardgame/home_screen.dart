import 'dart:async';

import 'package:cardgame/app.dart';
import 'package:cardgame/cardgame/cardgame_page.dart';
import 'package:cardgame/model/item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item> dataEASY = [];
  List<Item> dataMEDIUM = [];
  List<Item> dataHARD = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataEASY.addAll(Item.createDataEASY());
    dataMEDIUM.addAll(Item.createDataMEDIUM());
    dataHARD.addAll(Item.createDataHARD());
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Home Screen',
      ),
      body: buildBody(),
    );

  }

  Widget buildBody() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CardGame(
                  dataGame: dataEASY,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: (Stack(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 4,
                            color: Colors.black45,
                            spreadRadius: 0.5,
                            offset: Offset(3, 4))
                      ]),
                ),
                Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green.shade300,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 4,
                            color: Colors.black12,
                            spreadRadius: 0.3,
                            offset: Offset(
                              5,
                              3,
                            ))
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                          child: Text(
                        'EASY',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                blurRadius: 2,
                                offset: Offset(1, 2),
                              ),
                              Shadow(
                                  color: Colors.green,
                                  blurRadius: 2,
                                  offset: Offset(0.5, 2))
                            ]),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CardGame(
                  dataGame: dataMEDIUM,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: (Stack(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 4,
                            color: Colors.black45,
                            spreadRadius: 0.5,
                            offset: Offset(3, 4))
                      ]),
                ),
                Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.orange.shade300,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 4,
                            color: Colors.black12,
                            spreadRadius: 0.3,
                            offset: Offset(
                              5,
                              3,
                            ))
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                          child: Text(
                        'MEDIUM',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                blurRadius: 2,
                                offset: Offset(1, 2),
                              ),
                              Shadow(
                                  color: Colors.orange,
                                  blurRadius: 2,
                                  offset: Offset(0.5, 2))
                            ]),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(Icons.star, color: Colors.yellow),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CardGame(
                  dataGame: dataHARD,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: (Stack(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 4,
                            color: Colors.black45,
                            spreadRadius: 0.5,
                            offset: Offset(3, 4))
                      ]),
                ),
                Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 4,
                            color: Colors.black12,
                            spreadRadius: 0.3,
                            offset: Offset(
                              5,
                              3,
                            ))
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                          child: Text(
                        'MEDIUM',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                blurRadius: 2,
                                offset: Offset(1, 2),
                              ),
                              Shadow(
                                  color: Colors.red,
                                  blurRadius: 2,
                                  offset: Offset(0.5, 2))
                            ]),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ),
      ],
    );
  }



}
