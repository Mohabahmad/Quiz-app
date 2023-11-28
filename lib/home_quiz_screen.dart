import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/quiz-logo.png",
              height: 300,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            const SizedBox(
              height: 50,
              child: Text("llllllllllllllll"),
            ),
            OutlinedButton.icon(
              onPressed:() {
                startQuiz();
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              icon: const Icon(Icons.arrow_forward_sharp),
              label: const Text("click me "),
            )
          ],
        ),
      ),
    );
  }
}
