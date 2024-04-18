class GameModel {
  final String trueAnswer;
  final List<String> alphabets;
  final List<String> imageUrls;

  GameModel({
    required this.trueAnswer,
    required this.alphabets,
    required this.imageUrls,
  });

  GameModel copyWith({
    String? trueAnswer,
    List<String>? alphabets,
    List<String>? imageUrls,
  }) {
    return GameModel(
      trueAnswer: trueAnswer ?? this.trueAnswer,
      alphabets: alphabets ?? this.alphabets,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }
}
