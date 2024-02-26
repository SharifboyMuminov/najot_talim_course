import 'package:default_project/screens/routes.dart';
import 'package:default_project/screens/widgets/global_text_button.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.c_121212,
        body: Column(
          children: [
            60.getH(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.we),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                    AppImages.arrowBacksvg,
                    width: 24.we,
                    height: 23.we,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.we),
              child: Column(
                children: [
                  50.getH(),
                  Text(
                    "Welcome to UpTodo",
                    style: TextStyle(
                      color: AppColors.c_FFFFFF.withOpacity(0.87),
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  26.getH(),
                  Text(
                    "Please login to your account or create new account to continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.c_FFFFFF.withOpacity(0.87),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  390.getH(),
                  SizedBox(
                    width: double.infinity,
                    child: GlobalTextButton(
                      text: "Start",
                      pading: EdgeInsets.symmetric(vertical: 12.he),
                      onTab: () {
                        Navigator.pushReplacementNamed(context, RoutName.homeScreen);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
