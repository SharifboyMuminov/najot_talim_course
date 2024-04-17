class QuizModel {
  final String request;
  final String countText;
  List<String> alphabet;
  final String trueAnswer;

  QuizModel({
    required this.request,
    required this.alphabet,
    required this.countText,
    required this.trueAnswer,
  });
}
