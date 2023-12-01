import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/home_quiz_screen.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key });

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeQuiz = 'start-screen';

  void switchScreen() {
    setState(() {
      if (activeQuiz == 'results-screen') {
        // Reset the state when going back to the start screen
        selectedAnswers.clear();
      }
      activeQuiz = 'question-screen';
    });
  }

  void restart() {
    setState(() {
      // Reset the state when restarting
      selectedAnswers.clear();
      activeQuiz = 'start-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeQuiz = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;

    switch (activeQuiz) {
      case 'start-screen':
        currentScreen = HomeScreen(switchScreen);
        break;
      case 'question-screen':
        currentScreen = QuestionScreen(onSelectedAnswer: chooseAnswer);
        break;
      case 'results-screen':
        currentScreen = ResultsScreen(chosenAnswer: selectedAnswers, restart: restart);
        break;

      default:
        currentScreen = Container(); // Handle other cases if needed
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: currentScreen,
    );
  }
}
