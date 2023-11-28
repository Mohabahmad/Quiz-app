class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShufflesAnswers() {
    final shauffledList = List.of(answers);
    shauffledList.shuffle();
    return shauffledList;
  }
}
