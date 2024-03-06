import 'package:default_project/data/models/coffe_modul/coffe_modul.dart';
import 'package:default_project/utils/size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton(
      {super.key, required this.coffeModul, required this.onPressed});
  final CoffeModul coffeModul;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                coffeModul.imageUr,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.we, vertical: 8.he),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffeModul.name,
                  style: TextStyle(
                    color: AppColors.c_FFFFFF,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  coffeModul.subTitle,
                  style: TextStyle(
                    color: AppColors.c_FFFFFF.withOpacity(0.50),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                8.getH(),
                Text(
                  "home_screen.money".tr(args: [coffeModul.price.toString()]),
                  style: TextStyle(
                    color: AppColors.c_FFFFFF.withOpacity(0.90),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
