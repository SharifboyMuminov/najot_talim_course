import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Pgoda extends StatelessWidget {
  const Pgoda({super.key, required this.icon, required this.text});

  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          icon,
          width: 70.we,
        ),
        Text(
          text,
          style: TextStyle(
            color: AppColors.c_313341,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
