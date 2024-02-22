import 'package:default_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextGlobal extends StatelessWidget {
  const TextGlobal({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.c_FFFFFF,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
