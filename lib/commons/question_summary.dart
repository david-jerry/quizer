import 'package:flutter/material.dart';
import 'package:quiz/commons/question_index.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary({
    super.key,
    required this.summaryData,
  });

  List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionResultNumbering(
                  correct: (data['chosen_answer'] as String) ==
                      (data['correct_answers'] as String),
                  answerIndex: ((data['question_index'] as int) + 1),
                ),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (data['question'] as String),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: (data['chosen_answer'] as String) ==
                                  (data['correct_answers'] as String)
                              ? Colors
                                  .green // set green if chosen answer is correct
                              : Colors.red, // set amber otherwise Colors.amber,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          (data['chosen_answer'] as String),
                          style: const TextStyle(
                            color: Colors.white, // Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                        ),
                        child: Text(
                          (data['correct_answers'] as String),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
