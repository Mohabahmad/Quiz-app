import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex=0;
  void answerQuestion(){
    setState(() {
      currentQuestionIndex += 1;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Container(
          margin:const EdgeInsets.all(40) ,
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: const TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center ,
              ),
              const SizedBox(height: 30,),
              ...currentQuestion.getShufflesAnswers().map(
                (answer) {
                  return AnswerButton(
                    answerText: answer,
                    onTap: answerQuestion,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
