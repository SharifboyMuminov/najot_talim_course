import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VariantsItem extends StatelessWidget {
  const VariantsItem(
      {super.key,
      required this.title,
      required this.isActiv,
      required this.onTab});

  final String title;
  final bool isActiv;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.he),
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: isActiv ? AppColors.c_F2954D : AppColors.c_273032,
          padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 13.he),
          alignment: Alignment.centerLeft,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        onPressed: onTab,
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.c_F2F2F2,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
