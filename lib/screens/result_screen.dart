import 'package:flutter/material.dart';
import 'package:quiz/commons/question_summary.dart';
import 'package:quiz/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.reset,
    required this.selectedAnsers,
  });

  final void Function() reset;
  final List<String> selectedAnsers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnsers.length; i++) {
      // loop body, shall run until the loops condition is met
      summary.add({
        // set values for the summary
        'question_index': i,
        'question': questions[i].text,
        'correct_answers': questions[i].answers[0],
        'chosen_answer': selectedAnsers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    // filtering in flutter similar to django filter
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answers'] == data['chosen_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have answered $numCorrectQuestions of $numTotalQuestions questions correctly",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 20),
            // return the user answers and the correct answers here
            // while having in mind that since it has been separated
            // we can then add some logic to style correct and incorrect
            // and also add some logic to show the user the correct
            // answer and the correct answer
            QuestionSummary(
              summaryData: summaryData,
            ),
            const SizedBox(
              height: 20,
            ),
            // here is the button to restart the quiz from start
            TextButton(
              onPressed: reset,
              child: const Text(
                "Start Over",
                style: TextStyle(
                  color: Color.fromARGB(255, 188, 255, 125),
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
