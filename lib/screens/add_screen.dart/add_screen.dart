import 'package:default_project/screens/global_widget.dart/top_button.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
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
        backgroundColor: AppColors.c_252525,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.we),
          child: Column(
            children: [
              53.getH(),
              Row(
                children: [
                  ButtonTop(
                    icon: AppImages.arrowBack,
                    onTab: () {},
                  ),
                  const Spacer(),
                  ButtonTop(icon: AppImages.look, onTab: () {}),
                  21.getW(),
                  ButtonTop(icon: AppImages.save, onTab: () {}),
                ],
              ),
              TextField(
                cursorColor: AppColors.c_CCCCCC,
                style: TextStyle(
                  color: AppColors.c_FFFFFF,
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(
                    color: AppColors.c_9A9A9A,
                    fontSize: 48.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
