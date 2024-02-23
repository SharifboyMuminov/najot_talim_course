import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class MenuButton extends StatelessWidget {
  const MenuButton(
      {super.key,
      required this.onTab,
      required this.title,
      required this.isNotActiv});
  final VoidCallback onTab;
  final String title;
  final bool isNotActiv;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.we),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 10.he),
          backgroundColor: AppColors.c_414A61.withOpacity(isNotActiv ? 1 : 0.5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        ),
        onPressed: onTab,
        child: Text(
          title,
          style: TextStyle(
              color: AppColors.c_FFFFFF.withOpacity(isNotActiv ? 1 : 0.5),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
