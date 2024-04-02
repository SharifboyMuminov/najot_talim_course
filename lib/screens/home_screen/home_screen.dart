import 'package:default_project/cubits/timer/timer_cubit.dart';
import 'package:default_project/cubits/timer/timer_state.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
      ),
      body: BlocBuilder<TimerCubit, TamerState>(
        builder: (BuildContext context, TamerState state) {
          return Column(
            children: [
              Text(
                "${state.hour} : ${state.minute}",
                style: TextStyle(
                  fontSize: 25.sp,
                ),
              ),
              20.getH(),
              TextButton(
                onPressed: () {
                  context.read<TimerCubit>().startOrStop(true);
                },
                child: Text("Stop"),
              ),
              TextButton(
                onPressed: () {
                  context.read<TimerCubit>().startOrStop(false);
                },
                child: Text("Start"),
              ),
              TextButton(
                onPressed: () {
                  context.read<TimerCubit>().startOrStop(false);

                  Future.microtask(() {
                    context.read<TimerCubit>().startTime();
                  });
                },
                child: Text(state.stop ? "Stop" : "Start"),
              ),
            ],
          );
        },
      ),
    );
  }
}
