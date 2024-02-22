import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    super.key,
    this.icon,
    required this.title,
    this.backgroundColor = AppColors.c_FFFFFF,
    required this.textColor,
    required this.onTab,
    this.edgeInsets,
  });
  final String? icon;
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTab;
  final EdgeInsets? edgeInsets;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: edgeInsets,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding:  EdgeInsets.symmetric(horizontal: 30.we, vertical: 16.he),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        onPressed: onTab,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) SvgPicture.asset(icon!),
            if(icon != null) SizedBox(width: 24.we),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
