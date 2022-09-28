import 'dart:async';
import 'dart:math';

import 'package:cardgame/app.dart';
import 'package:cardgame/model/detail.dart';
import 'package:cardgame/model/item.dart';
import 'package:flutter/material.dart';
import 'package:cardgame/cardgame/answer_widget.dart';
import 'package:cardgame/cardgame/question_widget.dart';
import 'package:intl/intl.dart';

class CardGame extends StatefulWidget {
  List<Item> dataGame = [];

  CardGame({Key? key, required this.dataGame}) : super(key: key);

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {
  List<Item> items = [];
  var lastCodeSelected = '';
  var isLock = false;
  Timer? timer;

  DateFormat dateFormat = DateFormat('HH:mm:ss dd-MM-yyyy');
  Duration myDuration = Duration(days: 5);

  @override
  void initState() {
    super.initState();
    getData(widget.dataGame);
    print('Data game: ${items.length}');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');

    final minutes = strDigits(myDuration.inMinutes.remainder(20));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Scaffold(
      appBar: buildAppBar(context: context, title: 'Card Game'),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 32,
            width: double.infinity,
            color: Colors.yellow,
            child: Text(
              'Time: $minutes:$seconds',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                // if (item.isFlip) {
                //   return AnswerWidget(item: item);
                // }
                // return GestureDetector(
                //   onTap: () => onTapQuestion(item),
                //   child: const QuestionWidget(),
                // );

                return GestureDetector(
                  onTap: () {
                    onTapQuestion(item);
                    startTimer();
                  },
                  child: AnimatedSwitcher(
                    duration: Duration(seconds: 1),
                    child: item.isFlip
                        ? AnswerWidget(item: item)
                        : const QuestionWidget(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                replay();
              });
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              height: 50,
              width: 100,
              child: const Text(
                'Replay',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  void onTapQuestion(Item item) {
    print('item: ${item.code}');
    if (isLock || item.isFlip) {
      return;
    }

    final count = items
        .where((item) => item.isFlip == false && item.code == lastCodeSelected)
        .length;

    if (count == 0 || item.code == lastCodeSelected) {
      print('open');
      // mở
      lastCodeSelected = item.code;
      item.isFlip = true;
    } else {
      print('close');
      // đóng
      lastCodeSelected = '';

      // for (final item in items){
      //   item.isFlip = false;
      // }

      isLock = true;
      item.isFlip = true;
      Future.delayed(Duration(seconds: 1), () {
        for (final item in items) {
          item.isFlip = false;
        }
        isLock = false;
        setState(() {});
      });
    }

    setState(() {});
  }

  void replay() {
    List<Item> item = items;
    lastCodeSelected = '';
    Future.delayed(const Duration(seconds: 1), () {
      for (final item in items) {
        item.isFlip = false;
      }
      isLock = false;
      item.shuffle();
      setState(() {});
      print('Replay');
    });
  }

  void getData(List<Item> listItem) {
    items = List.from(listItem);
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        timer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }
}
