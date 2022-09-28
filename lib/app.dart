import 'package:cardgame/cardgame/cardgame_page.dart';
import 'package:cardgame/cardgame/home_page.dart';
import 'package:cardgame/cardgame/home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      title: 'Card Game',
      // home: HomePage(),
      home: HomeScreen(),
    );
  }
}

AppBar buildAppBar({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
  Color? backgroudColor,
}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
    backgroundColor: backgroudColor ?? Colors.pinkAccent,
    actions: actions,
    centerTitle: true,
  );
}