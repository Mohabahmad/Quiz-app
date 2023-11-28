import 'package:flutter/material.dart';
import 'package:quiz_app/home_quiz_screen.dart';
import 'package:quiz_app/question_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeQuiz = 'start-screen';

  void switchScreen() {
    setState(() {
      activeQuiz = 'questins-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: activeQuiz == 'start-screen'
          ? HomeScreen(switchScreen)
          : const QuestionScreen(),
    );
  }
}
