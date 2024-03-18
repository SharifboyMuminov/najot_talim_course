import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50.he,
      left: 10.we,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.c_000000,
              width: 0.5,
            ),
          ),
          child: Icon(
            Icons.arrow_back,
            size: 20.sp,
          ),
        ),
      ),
    );
  }
}
