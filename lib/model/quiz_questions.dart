class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getAnswers() {
    // public pproperty for the model class with a shuffle method
    // this is similar to django model property functions
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
