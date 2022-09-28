import 'package:cardgame/app.dart';
import 'package:cardgame/model/detail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final details = <Detail>[];

  @override
  void initState() {
    // details.addAll(Detail.createDataDetail());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Home',
      ),
      body: buildBody(),
    );



  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: details.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => details[index].goto,

                  ));
              print('${details[index].name}');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: details[index].primarycolor,
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
                        color: details[index].secomdarycolor,
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
                        Center(
                            child: Text(
                          details[index].name,
                          style: const TextStyle(
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
                          children: star(details[index].noOfstar),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );



  }

  List<Widget> star(int no) {
    List<Widget> icon = [];
    for (int i = 0; i < no; i++) {
      icon.insert(
          i,
          const Icon(
            Icons.star,
            color: Colors.yellow,
          ));
    }
    return icon;
  }
}
