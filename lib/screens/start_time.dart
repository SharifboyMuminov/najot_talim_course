import 'package:default_project/cubits/paln/plan_cubit.dart';
import 'package:default_project/cubits/timer/timer_cubit.dart';
import 'package:default_project/cubits/timer/timer_state.dart';
import 'package:default_project/data/models/time/time_model.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartTaskScreen extends StatefulWidget {
  const StartTaskScreen({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  State<StartTaskScreen> createState() => _StartTaskScreenState();
}

class _StartTaskScreenState extends State<StartTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TamerState>(
      builder: (BuildContext context, TamerState state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                if(state.hour == "00" && state.minute == "00"){
                  Navigator.pop(context);
                }
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 24.sp,
              ),
            ),
          ),
          body: Column(
            children: [
              Text(
                "${state.hour} : ${state.minute}",
                style: TextStyle(
                  fontSize: 45.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              20.getH(),
              Container(
                width: double.infinity,
                margin:
                    EdgeInsets.symmetric(horizontal: 24.we, vertical: 20.he),
                child: TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 13.he),
                      backgroundColor: Colors.green),
                  onPressed: () {
                    context.read<TimerCubit>().startOrStop(false);

                    Future.microtask(() {
                      context.read<TimerCubit>().startTime();
                    });
                  },
                  child: Text(
                    state.stop ? "Stop" : "Start",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              ),
              20.getH(),
              ListTile(
                title: Text(
                    "Tag  ${widget.taskModel.hour} : ${widget.taskModel.minute} :"),
                subtitle: Text(
                  widget.taskModel.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.sp,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
