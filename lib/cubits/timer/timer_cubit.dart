import 'package:default_project/cubits/timer/timer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerCubit extends Cubit<TamerState> {
  TimerCubit()
      : super(
          TamerState(
            hour: '01',
            minute: '00',
            error: false,
            stop: false,
          ),
        );

  setHourAndMinute(String hour, String minute) {
    emit(state.copyWithe(
        hour: hour.length == 1 ? "0$hour" : hour,
        minute: minute.length == 1 ? "0$minute" : minute));
  }

  startOrStop(bool v) {
    emit(state.copyWithe(stop: !state.stop));
  }

  Future<void> startTime() async {
    if (state.hour.length < 2 || state.minute.length < 2) {
      emit(
        state.copyWithe(
          error: true,
        ),
      );
    } else {
      if (state.stop) {
        int hour = int.parse(state.hour);
        int minu = 0;

        if (state.hour == "00") {
          minu = int.parse(state.minute);
        } else if (state.hour != "00" && state.minute == "00") {
          hour--;
          minu = 59;
        } else {
          minu = int.parse(state.minute);
        }
        // debugPrint("hour: ${state.hour}");
        // debugPrint("minute: ${state.minute}");

        for (int i = minu; i > 0; i--) {
          if (hour == 0 && i == 1) {
            i--;
          }
          String hourStr = hour.toString();
          String minuteStr = i.toString();
          if (i == 1 && hour != 0) {
            i = 60;
            hour--;
          }

          await Future.delayed(const Duration(seconds: 1));
          emit(
            state.copyWithe(
              hour: hourStr.length == 1 ? "0$hourStr" : hourStr,
              minute: minuteStr.length == 1 ? "0$minuteStr" : minuteStr,
            ),
          );
          if (!state.stop) {
            return;
          }
        }
        emit(state.copyWithe(stop: !state.stop));
      }
    }
  }
}
