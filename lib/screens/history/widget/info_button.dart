import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class InfoButton extends StatelessWidget {
  const InfoButton(
      {super.key,
      required this.onTab,
      this.iconData = Icons.share,
      required this.title});

  final VoidCallback onTab;
  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 13.he),
            backgroundColor: AppColors.c_FDB623,
          ),
          onPressed: onTab,
          child: Icon(
            iconData,
            color: AppColors.c_333333,
            size: 25.sp,
          ),
        ),
        SizedBox(height: 9.he),
        Text(
          title,
          style: TextStyle(
            color: AppColors.c_D9D9D9,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
