import 'package:default_project/data/models/task/task_modul.dart';
import 'package:default_project/screens/index/info/widget/show_gategoryi.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_images.dart';
import 'widget/text_view.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key, required this.taskModul});
  final TaskModul taskModul;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_272727,
      appBar: AppBar(
        backgroundColor: AppColors.c_121212,
        centerTitle: false,
        title: Text(
          taskModul.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.c_FFFFFF,
            fontSize: 17.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.we, vertical: 30.he),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  title: "Category :",
                ),
                SizedBox(width: 10.we),
                ShowCategoriy(taskModul: taskModul),
              ],
            ),
            SizedBox(height: 20.he),
            Row(
              children: [
                TextView(title: "Task Priority :  "),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.we, vertical: 8.he),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: AppColors.c_8687E7, width: 1.we),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.priorty,
                        width: 16.we,
                        height: 16.we,
                      ),
                      Text(
                        taskModul.priority.toString(),
                        style: TextStyle(
                          color: AppColors.c_E8E8E8,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.he),
            TextView(
              title: "Ded Line :  ${taskModul.day}  ${taskModul.hourMinut}",
            ),
            SizedBox(height: 40.he),
            Center(
              child: Text(
                "Decreption.",
                style: TextStyle(
                  color: AppColors.c_FFFFFF,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20.he),
            Text(
              taskModul.description,
              style: TextStyle(
                color: AppColors.c_FFFFFF,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
