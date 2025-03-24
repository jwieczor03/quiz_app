class QuizQuestion {
  final String question;
  final List<String> options;


  const QuizQuestion({
    required this.question,
    required this.options,
  });

  List<String> getShuffelsOptions() {
    final shuffeldList = List.of(options);
    shuffeldList.shuffle();
    return shuffeldList;
  }
}
