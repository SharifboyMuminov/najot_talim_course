class QuestionModul {
  final String question_test;
  final String true_answer;
  final List<dynamic> variants;

  QuestionModul(
      {required this.question_test,
      required this.true_answer,
      required this.variants});

  factory QuestionModul.fromJson(Map<String, dynamic> json) {
    return QuestionModul(
      question_test: json["question_test"] as String? ?? "Null",
      true_answer: json["true_answer"] as String? ?? "Null",
      variants: json["variants"] as List? ?? [],
    );
  }
}
