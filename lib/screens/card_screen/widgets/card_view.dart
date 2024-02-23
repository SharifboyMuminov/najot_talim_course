import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/moduls/card_modul.dart';
import '../../../utils/app_colors.dart';

class CardView extends StatelessWidget {
  const CardView({super.key, required this.cardModul});
  final CardModul cardModul;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.we),
      padding:
          EdgeInsets.only(left: 21.we, right: 21, top: 23.he, bottom: 10.he),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppColors.linearGradient,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              cardModul.icon,
              width: 44.we,
              height: 14.he,
            ),
          ),
          10.getH(),
          Text(
            "**** **** **${cardModul.numberCard}",
            style: TextStyle(
              color: AppColors.c_031952.withOpacity(0.86),
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          6.getH(),
          Text(
            "Available Balance",
            style: TextStyle(
              color: AppColors.c_FFFFFF,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          6.getH(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardModul.money,
                style: TextStyle(
                  color: AppColors.c_FFFFFF,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                cardModul.date,
                style: TextStyle(
                  color: AppColors.c_FFFFFF,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
