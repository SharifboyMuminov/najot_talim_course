import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';

class EmptyShow extends StatelessWidget {
  const EmptyShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        30.getH(),
        Image.asset("assets/images/empty_emaje.png"),
        Text(
          "What do you want to do today?",
          style: TextStyle(
            color: AppColors.c_FFFFFF.withOpacity(0.87),
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        10.getH(),
        Text(
          "Tap + to add your tasks",
          style: TextStyle(
            color: AppColors.c_FFFFFF.withOpacity(0.87),
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
