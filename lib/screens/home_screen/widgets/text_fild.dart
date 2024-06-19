import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {super.key, required this.onChge, required this.onTabXmark});

  final ValueChanged<String> onChge;
  final VoidCallback onTabXmark;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.c_CCCCCC,
      onChanged: onChge,
      style: TextStyle(
        color: AppColors.c_CCCCCC,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(horizontal: 30.we, vertical: 12.he),
        filled: true,
        fillColor: AppColors.c_3B3B3B,
        hintText: "Search",
        hintStyle: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: const BorderSide(color: AppColors.c_3B3B3B),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: const BorderSide(color: AppColors.c_3B3B3B),
        ),
        suffixIcon: IconButton(
          onPressed: onTabXmark,
          icon: SvgPicture.asset(AppImages.xmark),
        ),
      ),
    );
  }
}
