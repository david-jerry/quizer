import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/commons/answer_button.dart';
import 'package:quiz/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onChosenAnswer});

  final void Function(String answer) onChosenAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int curQuestIndex = 0;

  void answerQuestion(String chosenAnswer) {
    widget.onChosenAnswer(chosenAnswer);

    setState(() {
      curQuestIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[curQuestIndex];

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // question text
            Text(
              currentQuestion.text,
              style: GoogleFonts.lobster(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            // spacing between the question and the answers
            const SizedBox(
              height: 20,
            ),
            // the answers list from the currentQuestion map variable using the spread method
            ...currentQuestion.getAnswers().map((answer) {
              return AnswerButton(
                text: answer,
                onTap: () => {
                  answerQuestion(answer),
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
