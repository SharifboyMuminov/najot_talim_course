import 'package:default_project/screens/home/home_screen.dart';
import 'package:default_project/screens/password/cubit/password_cubit.dart';
import 'package:default_project/screens/password/cubit/password_state.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/password_button.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFF252525),
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Color(0xFF252525),
      ),
      child: BlocProvider(
        create: (context) => PasswordCubit(),
        child: BlocBuilder<PasswordCubit, PasswordState>(
          builder: (BuildContext context, PasswordState state) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.we),
                child: Column(
                  children: [
                    70.getH(),
                    Text(
                      "Security screen",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.sp,
                      ),
                    ),
                    50.getH(),
                    Text(
                      "Enter your passcode",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                    ),
                    50.getH(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          4,
                          (index) {
                            // debugPrint("asdfasdf");
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: index < state.password.length
                                    ? Colors.green
                                    : Colors.white10,
                                shape: BoxShape.circle,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    60.getH(),
                    _getButtons(
                      titles: ["1", "2", "3"],
                      callBacks: [
                        // onTab 1
                        () {
                          context
                              .read<PasswordCubit>()
                              .insertValue(context, "1");
                        },
                        // onTab 2

                        () {
                          context
                              .read<PasswordCubit>()
                              .insertValue(context, "2");
                        },
                        // onTab 3

                        () {
                          context
                              .read<PasswordCubit>()
                              .insertValue(context, "3");
                        },
                      ],
                    ),
                    20.getH(),
                    _getButtons(
                      titles: ["4", "5", "6"],
                      callBacks: [
                        // onTab 4
                        () {
                          context
                              .read<PasswordCubit>()
                              .insertValue(context, "4");
                        },
                        // onTab 5

                        () {
                          context
                              .read<PasswordCubit>()
                              .insertValue(context, "5");
                        },
                        // onTab 6

                        () {
                          context
                              .read<PasswordCubit>()
                              .insertValue(context, "6");
                        },
                      ],
                    ),
                    20.getH(),
                    _getButtons(
                      titles: ["7", "8", "9"],
                      callBacks: [
                        // onTab 7
                        () {
                          context
                              .read<PasswordCubit>()
                              .insertValue(context, "7");
                        },
                        // onTab 8

                        () {
                          context
                              .read<PasswordCubit>()
                              .insertValue(context, "8");
                        },
                        // onTab 9

                        () {
                          context
                              .read<PasswordCubit>()
                              .insertValue(context, "9");
                        },
                      ],
                    ),
                    20.getH(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),
                        PasswordButton(
                          title: "0",
                          onTab: () {
                            context
                                .read<PasswordCubit>()
                                .insertValue(context, "0");
                          },
                        ),
                        SizedBox(width: 40.we),
                        PasswordButton(
                          title: "",
                          onTab: () {
                            context.read<PasswordCubit>().remove();
                          },
                          iconData: Icons.backspace_sharp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }


  Widget _getButtons(
      {required List<String> titles, required List<VoidCallback> callBacks}) {
    if (titles.length < 3 || callBacks.length < 3) {
      return const SizedBox();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PasswordButton(
          title: titles[0],
          onTab: callBacks[0],
        ),
        PasswordButton(
          title: titles[1],
          onTab: callBacks[1],
        ),
        PasswordButton(
          title: titles[2],
          onTab: callBacks[2],
        ),
      ],
    );
  }
}
