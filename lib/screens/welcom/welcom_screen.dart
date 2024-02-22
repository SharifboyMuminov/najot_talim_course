import 'package:default_project/screens/sign/sign_screen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/local/storage_repository.dart';
import '../../utils/local_keys.dart';
import '../home_screen/home_screen.dart';
import '../on_boarding/on_boarding_screen.dart';
import '../widgets/global_button.dart';
import '../widgets/global_skip_button.dart';

class WelcomScreen extends StatefulWidget {
  const WelcomScreen({super.key});

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.c_0001FC,
      body: Column(
        children: [
          const SizedBox(width: double.infinity),
          160.getH(),
          Text(
            "LATECH",
            style: TextStyle(
                color: AppColors.c_FFFFFF,
                fontSize: 42.sp,
                fontWeight: FontWeight.w700),
          ),
          Text(
            "TECH MARKET",
            style: TextStyle(
                color: AppColors.c_FFFFFF,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600),
          ),
          57.getH(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 33.we, vertical: 66.he),
            decoration: BoxDecoration(
              color: AppColors.c_0001FC,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.c_FFFFFF.withOpacity(0.25),
                  blurRadius: 80,
                  offset: const Offset(-30, -30),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 80,
                  offset: const Offset(30, 30),
                ),
              ],
            ),
            child: Image.asset(
              AppImages.image1,
              width: 148.we,
              height: 83.he,
            ),
          ),
          72.getH(),
          GlobalButton(
            title: "Let’s start",
            textColor: AppColors.c_0001FC,
            onTab: _setScreen,
            edgeInsets: EdgeInsets.symmetric(horizontal: 32.we),
          ),
          const Spacer(),
          GlobalScipButton(
            title: 'Skip',
            onTab: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    if (!StorageRepository.getBool(key: ShareKeys.isRegister)) {
                      return const SignScreen();
                    }
                    return const HomeScreen();
                  },
                ),
              );
            },
          ),
          99.getH(),
        ],
      ),
    );
  }

  _setScreen() {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (!StorageRepository.getBool(key: ShareKeys.isOnbar)) {
            return const OnBoardingScreen();
          }
          if (!StorageRepository.getBool(key: ShareKeys.isRegister)) {
            return const SignScreen();
          }
          return const HomeScreen();
        },
      ),
    );
  }
}
