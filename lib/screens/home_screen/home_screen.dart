import 'package:cached_network_image/cached_network_image.dart';
import 'package:default_project/cobits/game/game_cubit.dart';
import 'package:default_project/screens/home_screen/widget/show_image.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            const ShowImage(),
            BlocBuilder<GameCubit, GameSingle>(
              builder: (BuildContext context, GameSingle state) {
                return Column(
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
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.we, vertical: 10.he),

                            child: CachedNetworkImage(
                              imageUrl:
                                  state.games[state.currentIndex].imageUrls[0],
                              placeholder: (context, url) => Container(
                                width: width,
                                height: height,
                                color: Colors.grey,
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fit: BoxFit.cover,
                              height: 140.he,
                            ),
                          ),
                        ),
                        Expanded(
                          child: CachedNetworkImage(
                            imageUrl:
                                state.games[state.currentIndex].imageUrls[1],
                            placeholder: (context, url) => Container(
                              width: width,
                              height: height,
                              color: Colors.grey,
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                            height: 130.he,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
