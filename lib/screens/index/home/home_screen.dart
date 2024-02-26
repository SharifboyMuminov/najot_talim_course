import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.c_121212,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Index",
            style: TextStyle(
              color: AppColors.c_FFFFFF.withOpacity(0.87),
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          elevation: 0,
          backgroundColor: AppColors.c_121212,
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppImages.menu,
            ),
          ),
        ),
      ),
    );
  }
}
