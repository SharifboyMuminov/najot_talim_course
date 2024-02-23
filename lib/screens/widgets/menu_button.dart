import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.onTab,
    required this.title,
    required this.isNotActiv,
    this.icon,
    this.colorIcon,
  });
  final VoidCallback onTab;
  final String title;
  final bool isNotActiv;
  final String? icon;
  final Color? colorIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.we),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 10.he),
          backgroundColor: AppColors.c_414A61.withOpacity(isNotActiv ? 1 : 0.5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        ),
        onPressed: onTab,
        child: Row(
          children: [
            if (icon != null && colorIcon != null)
              SvgPicture.asset(
                icon!,
                width: 16.we,
                height: 16.he,
                colorFilter: ColorFilter.mode(
                  colorIcon!.withOpacity(isNotActiv ? 1 : 0.75),
                  BlendMode.srcIn,
                ),
              ),
            if(icon != null) SizedBox(width: 5.we), 
            Text(
              title,
              style: TextStyle(
                  color: AppColors.c_FFFFFF.withOpacity(isNotActiv ? 1 : 0.5),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
