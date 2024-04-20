import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TabBarButton extends StatelessWidget {
  const TabBarButton(
      {super.key,
      required this.onTab,
      required this.iconPath,
      required this.isActive,
      required this.title});

  final VoidCallback onTab;
  final String iconPath;
  final bool isActive;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTab,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 30.we,
            height: 30.we,
            colorFilter: ColorFilter.mode(
                isActive ? AppColors.c_FDB623 : AppColors.c_D9D9D9,
                BlendMode.srcIn),
          ),
          Text(
            title,
            style: TextStyle(
              color: isActive ? AppColors.c_FDB623 : AppColors.c_D9D9D9,
              fontWeight: FontWeight.w400,
              fontSize: 17.sp,
            ),
          ),
        ],
      ),
    );
  }
}
