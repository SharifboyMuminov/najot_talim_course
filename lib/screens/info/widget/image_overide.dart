import 'package:default_project/data/models/coffe_modul/coffe_modul.dart';
import 'package:default_project/utils/size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_colors.dart';

class ImageOverItem extends StatelessWidget {
  const ImageOverItem({super.key, required this.coffeModul, required this.onTabAdd});
  final CoffeModul coffeModul;
  final VoidCallback onTabAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.we, vertical: 16.he),
      decoration: const BoxDecoration(color: Colors.black54),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                coffeModul.name,
                style: TextStyle(
                  color: AppColors.c_FFFFFF,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              SvgPicture.asset("assets/icons/star.svg"),
              SizedBox(width: 8.we),
              Text(
                "4.6",
                style: TextStyle(
                  color: AppColors.c_FFFFFF,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          4.getH(),
          Text(
            coffeModul.subTitle,
            style: TextStyle(
              color: AppColors.c_FFFFFF.withOpacity(0.50),
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          16.getH(),
          Row(
            children: [
              Expanded(
                child: Text(
                  "home_screen.money".tr(args: [coffeModul.price.toString()]),
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.c_D17842,
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.c_D17842,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r)),
                  ),
                  onPressed: onTabAdd,
                  child: Text(
                    "info_screen.button_title_one".tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.c_FFFFFF,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
