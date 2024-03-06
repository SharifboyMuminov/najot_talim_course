import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeButton extends StatelessWidget {
  const SizeButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.isActiv});
  final VoidCallback onPressed;
  final String title;
  final bool isActiv;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 8.he),
        side: isActiv
            ? const BorderSide(width: 1, color: AppColors.c_D17842)
            : null,
        backgroundColor: isActiv ? null : AppColors.c_FFFFFF.withOpacity(0.05),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: isActiv ? AppColors.c_D17842 : AppColors.c_FFFFFF,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
