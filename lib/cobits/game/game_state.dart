import 'package:default_project/data/models/game/game_model.dart';

class GameSingle {
  List<GameModel> games;
  int currentIndex;
  List<String> inputText;
  bool gameOver;

  GameSingle({
    required this.currentIndex,
    required this.games,
    required this.inputText,
    this.gameOver = false,
  });

  GameSingle copyWith({
    List<GameModel>? games,
    int? currentIndex,
    bool? gameOver,
    List<String>? inoputText,
  }) {
    return GameSingle(
        currentIndex: currentIndex ?? this.currentIndex,
        games: games ?? this.games,
        inputText: inoputText ?? this.inputText,
        gameOver: gameOver ?? this.gameOver);
  }
}
