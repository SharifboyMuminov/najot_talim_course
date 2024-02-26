import 'package:default_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalTextButton extends StatelessWidget {
  const GlobalTextButton(
      {super.key,
      required this.text,
      required this.pading,
      required this.onTab});
  final String text;
  final EdgeInsets pading;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: pading,
        backgroundColor: AppColors.c_8875FF,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
      onPressed: onTab,
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.c_FFFFFF,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
