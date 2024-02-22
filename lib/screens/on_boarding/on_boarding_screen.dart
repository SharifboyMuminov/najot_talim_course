import 'package:default_project/screens/widgets/global_skip_button.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/local/local_list.dart';
import '../connexion/connexion.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int activIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_0001FC,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ...List.generate(
                  images.length,
                  (index) {
                    return Image.asset(
                      images[index],
                    );
                  },
                ),
              ],
            ),
          ),
          Text(
            texts[activIndex],
            style: TextStyle(
              color: AppColors.c_FFFFFF,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          40.getH(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                4,
                (index) {
                  int a = activIndex == index ? 7 : 5;
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.we),
                    width: a.we,
                    height: a.we,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.c_FFFFFF
                          .withOpacity(activIndex == index ? 1 : 0.32),
                    ),
                  );
                },
              ),
            ],
          ),
          40.getH(),
          GlobalScipButton(
            title: "Next",
            onTab: () {
              if (activIndex == 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ConnexionScreen();
                    },
                  ),
                );
                return;
              }
              pageController.jumpToPage(activIndex + 1);

              activIndex++;

              setState(() {});
            },
          ),
          79.getH(),
        ],
      ),
    );
  }
}
