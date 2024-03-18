import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_colors.dart';

class CalculationButton extends StatelessWidget {
  const CalculationButton({
    super.key,
    required this.title,
    required this.onTab,
    required this.color,
    this.isSvg = false,
    this.icon = "assets/icons/delet.svg",
  });

  final String title;
  final VoidCallback onTab;
  final Color color;
  final bool isSvg;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.r),
      child: Material(
        color: const Color(0xFFE9F6FF),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.we, vertical: 15.he),
          child: IconButton(
            onPressed: onTab,
            icon: isSvg
                ? SvgPicture.asset(icon)
                : Text(
                    title,
                    style: TextStyle(
                      color: color,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
