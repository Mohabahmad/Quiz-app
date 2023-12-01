import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key? key, required this.chosenAnswer, required this.restart}) : super(key: key);
  final List<String> chosenAnswer;
  final VoidCallback restart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers,
        'user_answer': chosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectAnswer = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'you answerd $numCorrectAnswer out of $numTotalQuestion question correctly!',
              style: GoogleFonts.lato(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: restart,
              
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.restart_alt_rounded),
                  SizedBox(width: 8,),
                  Text('RESTART QUIZ')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
