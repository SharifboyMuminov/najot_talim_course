import 'package:default_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyConterin extends StatelessWidget {
  const MyConterin({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.c_292929,
        ),
        child: child,
      ),
    );
  }
}
