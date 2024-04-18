import 'package:default_project/data/local/local_varibals.dart';
import 'package:default_project/data/models/game/game_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameCubit extends Cubit<GameSingle> {
  GameCubit()
      : super(
          GameSingle(
            currentIndex: 0,
            games: gameModels,
          ),
        );
}


class GameSingle {
  List<GameModel> games;
  int currentIndex;

  GameSingle({
    required this.currentIndex,
    required this.games,
  });
}
