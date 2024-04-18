import 'package:cached_network_image/cached_network_image.dart';
import 'package:default_project/cobits/game/game_cubit.dart';
import 'package:default_project/screens/home_screen/widget/show_bacground_image.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/show_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late Animation<Alignment> animationAlign;

  // void initState() {
  //   globalAnimationController = AnimationController(
  //       vsync: this, duration: const Duration(milliseconds: 500));
  //
  //   animationAlign = TweenSequence<Alignment>([
  //     TweenSequenceItem<Alignment>(
  //         tween: Tween(begin: Alignment.center, end: Alignment.centerLeft),
  //         weight: 40),
  //     TweenSequenceItem<Alignment>(
  //         tween: Tween(begin: Alignment.centerLeft, end: Alignment.center),
  //         weight: 40),
  //     TweenSequenceItem<Alignment>(
  //         tween: Tween(begin: Alignment.centerRight, end: Alignment.center),
  //         weight: 40),
  //   ]).animate(CurvedAnimation(
  //       parent: globalAnimationController, curve: Curves.decelerate));
  //
  //   globalAnimationController.addListener(() {
  //     setState(() {});
  //   });
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.c_252525,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.c_252525,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            const ShowBacgroundImage(),
            BlocBuilder<GameCubit, GameSingle>(
              builder: (BuildContext context, GameSingle state) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 50.he, width: width),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.we,
                          vertical: 10.he,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          "${state.currentIndex + 1}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 25.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.he),
                      Row(
                        children: [
                          ShowImage(
                              urlImage:
                                  state.games[state.currentIndex].imageUrls[0]),
                          ShowImage(
                              urlImage:
                                  state.games[state.currentIndex].imageUrls[1]),
                        ],
                      ),
                      Row(
                        children: [
                          ShowImage(
                              urlImage:
                                  state.games[state.currentIndex].imageUrls[2]),
                          ShowImage(
                              urlImage:
                                  state.games[state.currentIndex].imageUrls[3]),
                        ],
                      ),
                      SizedBox(height: 20.he),
                      Align(
                        alignment: Alignment.center,
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: List.generate(
                            state.games[state.currentIndex].trueAnswer.length,
                            (index) {
                              if (state.inoputText.length > index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5.we, vertical: 5.he),
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.we, vertical: 15.we),
                                        backgroundColor:
                                            Colors.blue.withOpacity(0.5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                        ),
                                        side: BorderSide(
                                            color: Colors.blueAccent,
                                            width: 2.we),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        state.inoputText[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                );
                              }
                              return Container(
                                width: 55.we,
                                height: 57.we,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5.we, vertical: 5.he),
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.5),
                                  border: Border.all(
                                      color: Colors.blueAccent, width: 2.we),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20.he),
                      Wrap(
                        direction: Axis.horizontal,
                        children: List.generate(
                          state.games[state.currentIndex].alphabets.length,
                          (index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5.we, vertical: 5.he),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.we, vertical: 15.we),
                                  backgroundColor: Colors.blue.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  side: BorderSide(
                                      color: Colors.blueAccent, width: 2.we),
                                ),
                                onPressed: () {},
                                child: Text(
                                  state.games[state.currentIndex]
                                      .alphabets[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
