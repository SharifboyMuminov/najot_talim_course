import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

showSnackBarMy(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        text,
        style: TextStyle(color: AppColors.c_FFFFFF, fontSize: 22.sp),
      ),
    ),
  );
}
