import 'package:default_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalScipButton extends StatelessWidget {
  const GlobalScipButton({super.key, required this.title, required this.onTab});
  final String title;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTab,
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.c_FFFFFF,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
