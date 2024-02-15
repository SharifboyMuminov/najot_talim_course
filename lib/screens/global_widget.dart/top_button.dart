import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ButtonTop extends StatelessWidget {
  const ButtonTop({super.key, required this.icon, required this.onTab});

  final String icon;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 13.we, vertical: 16.we),
        backgroundColor: AppColors.c_3B3B3B,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      onPressed: onTab,
      child: SvgPicture.asset(
        icon,
        width: 24.we,
        height: 24.we,
      ),
    );
  }
}
