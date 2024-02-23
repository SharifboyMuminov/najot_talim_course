import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AdminButton extends StatelessWidget {
  const AdminButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTab});

  final String title;
  final String icon;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Ink(
          child: InkWell(
            onTap: onTab,
            child: Container(
              width: 76.we,
              height: 76.we,
              decoration: const BoxDecoration(
                color: AppColors.c_DBE3F8,
                shape: BoxShape.circle,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SvgPicture.asset(
                      icon,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        19.getH(),
        Text(
          title,
          style: TextStyle(
            color: AppColors.c_EEEEEE,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
