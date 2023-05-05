import 'package:flutter/material.dart';

class QuestionResultNumbering extends StatelessWidget {
  const QuestionResultNumbering({
    super.key,
    required this.correct,
    required this.answerIndex,
  });

  final bool correct;
  final int answerIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: correct
            ? Colors.green // set green if chosen answer is correct
            : Colors.red,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        answerIndex.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
    );
  }
}
