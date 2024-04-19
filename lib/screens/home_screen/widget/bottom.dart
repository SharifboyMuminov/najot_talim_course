import 'package:default_project/cobits/game/game_cubit.dart';
import 'package:default_project/screens/home_screen/widget/input_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomItem extends StatelessWidget {
  const BottomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      direction: Axis.horizontal,
      children: List.generate(
        context
            .watch<GameCubit>()
            .state
            .games[context.watch<GameCubit>().state.currentIndex]
            .alphabets
            .length,
        (index) {
          return InputAndAlphabetsButtons(
            onTab: () {
              context.read<GameCubit>().input(
                  context,
                  context
                      .read<GameCubit>()
                      .state
                      .games[context.read<GameCubit>().state.currentIndex]
                      .alphabets[index]);
            },
            title: context
                .watch<GameCubit>()
                .state
                .games[context.watch<GameCubit>().state.currentIndex]
                .alphabets[index],
            key2: Key(context
                .watch<GameCubit>()
                .state
                .games[context.watch<GameCubit>().state.currentIndex]
                .alphabets[index]),
          );
        },
      ),
    );
  }
}
