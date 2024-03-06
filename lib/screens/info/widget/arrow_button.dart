import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_colors.dart';

class ArrowButtonMy extends StatelessWidget {
  const ArrowButtonMy({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.we, vertical: 16.he),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.c_0C0F14,
          padding: EdgeInsets.symmetric(horizontal: 10.we, vertical: 15.he),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: SvgPicture.asset(
          "assets/icons/arrow.svg",
          width: 18.we,
          height: 18.we,
        ),
      ),
    );
  }
}
