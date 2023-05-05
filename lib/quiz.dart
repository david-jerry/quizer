import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/screens/question_screen.dart';
import 'package:quiz/screens/result_screen.dart';
import 'package:quiz/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

// adding _ make sure that the state is created only once and only for this files
class _QuizState extends State<Quiz> {
  // do not use final to ensure the list can be reset when the conditions for it has been met
  // final List<String> answers = [];
  List<String> answers = [];
  String activeScreen = "start-screen";

  // switch to other screen here
  void switchScreen() {
    setState(
      () => {
        activeScreen = "questions-screen",
      },
    );
  }

  void chosenAnswer(String answer) {
    answers.add(answer);

    // check if we have reached the last question and has also answered it
    if (answers.length == questions.length) {
      setState(
        () => {
          // answers = [],
          activeScreen = "results-screen",
        },
      );
    }
  }

  void reset() {
    setState(() {
      activeScreen = "questions-screen";
      answers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(switchScreen);

    if (activeScreen == "questions-screen") {
      screen = QuestionsScreen(
        onChosenAnswer: chosenAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screen = ResultsScreen(
        reset: reset,
        selectedAnsers: answers,
      );
    }

    return MaterialApp(
      title: 'Quiz',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orangeAccent,
                Colors.deepOrangeAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}
