import 'package:cardgame/model/item.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatefulWidget {

  final Item item;

  const AnswerWidget({super.key, required this.item});

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(widget.item.photo,fit: BoxFit.cover,),
    );
  }
}
