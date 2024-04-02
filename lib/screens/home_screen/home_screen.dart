import 'package:default_project/cubits/paln/plan_cubit.dart';
import 'package:default_project/cubits/paln/plan_state.dart';
import 'package:default_project/cubits/timer/timer_cubit.dart';
import 'package:default_project/cubits/timer/timer_state.dart';
import 'package:default_project/data/api_provider/api_provider.dart';
import 'package:default_project/screens/banc/banc_screen.dart';
import 'package:default_project/screens/set_info/set_info.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Timer",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SetInfo();
                  },
                ),
              );
            },
            icon: Icon(
              Icons.settings,
              size: 24.sp,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const BankScreen();
                  },
                ),
              );
            },
            icon: Icon(
              Icons.exit_to_app,
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<TimerCubit, TamerState>(
              builder: (BuildContext context, TamerState state) {
                return Column(
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
                      margin: EdgeInsets.symmetric(
                          horizontal: 24.we, vertical: 20.he),
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
                  ],
                );
              },
            ),
            BlocBuilder<PlanCubit, PlanState>(
              builder: (BuildContext context, PlanState state) {
                return Column(
                  children: [
                    ...List.generate(
                      state.plans.length,
                      (index) {
                        return ListTile(
                          title: Text("Tag"),
                          subtitle: Text(
                            state.plans[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.sp,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
