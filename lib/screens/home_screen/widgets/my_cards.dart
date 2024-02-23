import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class MenutextAndButton extends StatelessWidget {
  const MenutextAndButton({
    super.key,
    required this.onTab,
    required this.text,
  });
  
  final VoidCallback onTab;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            color: AppColors.c_EEEEEE,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 3.we),
          ),
          onPressed: onTab,
          child: Text(
            "View All",
            style: TextStyle(
              color: AppColors.c_EEEEEE,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.c_EEEEEE,
            ),
          ),
        ),
      ],
    );
  }
}
