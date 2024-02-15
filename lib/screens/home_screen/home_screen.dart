import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:default_project/screens/widgets/global_appbar.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/size.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.c_273032,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.c_273032,
      ),
      child: Scaffold(
        backgroundColor: AppColors.c_273032,
        body: Column(
          children: [
            SizedBox(height: 50.he),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.we),
              child: GlobalAppBar(
                title: "Start Quiz",
                onTabArrow: () {},
              ),
            ),
            SizedBox(height: 22.he),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: AppColors.c_162023,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.r),
                        topRight: Radius.circular(40.r),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                          left: 32.we, right: 32.we, top: 32.he),
                      child: Column(
                        children: [
                          Text(
                            "Put your understanding of this concept to test by answering a few MCQs.",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.c_F2F2F2,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 15.he),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // alignment: Alignment.bottomRight,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 18.we, vertical: 35.he),
                                  decoration: BoxDecoration(
                                    color: AppColors.c_F2954D,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 146.we,
                                        child: Text(
                                          "Pair of Linear Equation in Two Variables ",
                                          style: TextStyle(
                                            color: AppColors.c_F2F2F2,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Image.asset(
                                          AppImages.iamge1,
                                          width: 240,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.we),
                                  child: Column(
                                    children: [
                                      _getRichText(
                                          text1: "Subject: ", text2: "Maths"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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

  _getRichText({required text1, required text2}) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: TextStyle(
          color: AppColors.c_F2F2F2,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: text2,
            style: TextStyle(
              color: AppColors.c_F2F2F2,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
