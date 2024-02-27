import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class AddtextFild extends StatelessWidget {
  const AddtextFild({
    super.key,
    required this.controller,
    required this.hintText,
    required this.textInputAction,
  });
  final TextEditingController controller;
  final String hintText;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: textInputAction,
      cursorColor: AppColors.c_FFFFFF.withOpacity(0.87),
      style: TextStyle(
        color: AppColors.c_FFFFFF.withOpacity(0.87),
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),
      maxLines: null,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: 12.we, vertical: 8.he),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(color: AppColors.c_979797, width: 1.we),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.c_AFAFAF, fontSize: 18.sp),
      ),
    );
  }
}
