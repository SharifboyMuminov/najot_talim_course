import 'dart:math';

import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class GlobalTextFild extends StatelessWidget {
  const GlobalTextFild({
    super.key,
    required this.isError,
    required this.text,
    required this.hinText,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.edgeInsets,
  });
  final bool isError;
  final String text;
  final String hinText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final EdgeInsets? edgeInsets;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: edgeInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              color: AppColors.c_FFFFFF,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          6.getH(),
          TextFormField(
            controller: controller,
            keyboardType: textInputType,
            style: TextStyle(
              color: AppColors.c_FFFFFF,
              fontSize: 18.sp,
            ),
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.we, vertical: 8.he),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.r),
                  borderSide:
                      const BorderSide(color: AppColors.c_FFFFFF, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.r),
                  borderSide:
                      const BorderSide(color: AppColors.c_FFFFFF, width: 0.5),
                ),
                hintText: hinText,
                hintStyle: TextStyle(
                  color: AppColors.c_FFFFFF,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.r),
                  borderSide: const BorderSide(color: Colors.red, width: 0.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.r),
                  borderSide: const BorderSide(color: Colors.red, width: 1),
                ),
                errorText: isError ? "error :(" : null),
          ),
        ],
      ),
    );
  }
}
