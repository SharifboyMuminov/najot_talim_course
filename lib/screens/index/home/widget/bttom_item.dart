import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_colors.dart';

class BottomItem extends StatelessWidget {
  const BottomItem(
      {super.key,
      required this.onTab,
      required this.title,
      required this.icon});

  final VoidCallback onTab;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onTab,
          icon: SvgPicture.asset(
            icon,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: AppColors.c_FFFFFF.withOpacity(0.87),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
