import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogButton extends StatelessWidget {
  const DialogButton(
      {super.key,
      required this.title,
      required this.onTab,
      required this.backgroundColor});
  final String title;
  final VoidCallback onTab;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 25.we, vertical: 7.he),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
      onPressed: onTab,
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.c_FFFFFF,
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
