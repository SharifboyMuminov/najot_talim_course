import 'package:default_project/data/local/local_varibals.dart';
import 'package:default_project/data/models/game/game_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameCubit extends Cubit<GameSingle> {
  GameCubit()
      : super(
    GameSingle(
      currentIndex: 0,
      games: gameModels,
      inoputText: [],
    ),
  );

  void input(String value) {
    emit(state.copyWith(
      inoputText: state.inoputText,
    ));
  }
}

class GameSingle {
  List<GameModel> games;
  int currentIndex;
  List<String> inoputText;

  GameSingle({
    required this.currentIndex,
    required this.games,
    required this.inoputText,
  });

  GameSingle copyWith({
    List<GameModel>? games,
    int? currentIndex,
    List<String>? inoputText,
  }) {
    return GameSingle(
        currentIndex: currentIndex ?? this.currentIndex,
        games: games ?? this.games,
        inoputText: inoputText ?? this.inoputText);
  }
}
