import 'package:cardgame/cardgame/cardgame_page.dart';
import 'package:cardgame/cardgame/home_page.dart';
import 'package:cardgame/model/item.dart';

import 'package:flutter/material.dart';

class Detail {
  final String name;
  final Color primarycolor;
  final Color secomdarycolor;
  Widget goto;
  final int noOfstar;

  Detail(this.name, this.primarycolor, this.secomdarycolor, this.noOfstar,
      this.goto);
}
//   static List<Detail> createDataDetail() {
//     final List<Detail> details = [];
//     details.add(Detail("EASY", Colors.green, Colors.green.shade300, 1,
//         const CardGame(level: Level.Easy)));
//
//     details.add(Detail("MEDIUM", Colors.orange, Colors.orange.shade300, 2,
//         const CardGame(level: Level.Medium)));
//     details.add(Detail("HARD", Colors.red, Colors.red.shade300, 3,
//         const CardGame(level: Level.Hard)));
//
//     return details;
//   }
// }
//
//
//
//
//
// enum Level { Easy, Medium, Hard }
//  List getSourceArray(
//   Level level,
// ) {
//   List<String> levelAndKindList = <String>[];
//   List sourceArray = Item.createData();
//   if (level == Level.Hard) {
//     for (var element in sourceArray) {
//       levelAndKindList.add(element);
//     }
//   } else if (level == Level.Medium) {
//     for (int i = 0; i < 12; i++) {
//       levelAndKindList.add(sourceArray[i]);
//     }
//   } else if (level == Level.Easy) {
//     for (int i = 0; i < 6; i++) {
//       levelAndKindList.add(sourceArray[i]);
//     }
//   }
//
//   levelAndKindList.shuffle();
//   return levelAndKindList;
// }
//
//
