import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GlobalAppBar extends StatelessWidget {
  const GlobalAppBar({
    super.key,
    required this.title,
    required this.onTabArrow,
    this.widget,
  });

  final String title;
  final VoidCallback onTabArrow;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 12.we, vertical: 16.he),
            backgroundColor: AppColors.c_162023,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          onPressed: onTabArrow,
          child: SvgPicture.asset(AppImages.arrowBack),
        ),
        SizedBox(width: 16.we),
        Text(
          title,
          style: TextStyle(
            color: AppColors.c_F2F2F2,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        if (widget != null) widget!,
      ],
    );
  }
}
