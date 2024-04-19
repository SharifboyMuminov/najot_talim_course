import 'package:default_project/cobits/game/game_state.dart';
import 'package:default_project/cobits/widget/show_dialog_end.dart';
import 'package:default_project/data/local/local_varibals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameCubit extends Cubit<GameSingle> {
  GameCubit()
      : super(GameSingle(
          currentIndex: 0,
          games: gameModels,
          inputText: [],
        ));

  void input(BuildContext context,String value) {
    if(state.inputText.length < state.games[state.currentIndex].trueAnswer.length){
      state.inputText.add(value);
      state.games[state.currentIndex].alphabets.remove(value);
      if (state.inputText.length ==
          state.games[state.currentIndex].trueAnswer.length) {
        if (state.inputText.join("") ==
            state.games[state.currentIndex].trueAnswer) {
          state.currentIndex++;
          if (state.currentIndex == state.games.length) {
            state.games[state.currentIndex - 1].alphabets
                .addAll(state.inputText);
            emit(state.copyWith(currentIndex: 0, inoputText: [], gameOver: true));
            showDialogEng(context);
          } else {
            state.games[state.currentIndex - 1].alphabets
                .addAll(state.inputText);
            emit(state.copyWith(
              currentIndex: state.currentIndex,
              inoputText: [],
            ));
          }
        }
      }

      emit(state.copyWith(
        inoputText: state.inputText,
        games: state.games,
        gameOver: false,
      ));
    }
  }

  void removeInput(String value) {
    state.inputText.remove(value);
    state.games[state.currentIndex].alphabets.add(value);

    emit(state.copyWith(
      inoputText: state.inputText,
      games: state.games,
    ));
  }
}
