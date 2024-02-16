import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BttomButton extends StatelessWidget {
  const BttomButton({
    super.key,
    required this.colorTitle,
    required this.colorBacground,
    required this.title,
    required this.ontTab,
  });

  final String title;
  final Color colorTitle;
  final Color colorBacground;
  final VoidCallback ontTab;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 21.we, vertical: 12.he),
        backgroundColor: colorBacground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      onPressed: ontTab,
      child: Text(
        title,
        style: TextStyle(
          color: colorTitle,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
