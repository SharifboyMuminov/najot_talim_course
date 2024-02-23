import 'package:default_project/data/moduls/card_modul.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_colors.dart';

class MyCardsButton extends StatelessWidget {
  const MyCardsButton({
    super.key,
    required this.onTab,
    required this.cardModul,
    required this.isNotEnd,
  });
  final VoidCallback onTab;
  final CardModul cardModul;
  final bool isNotEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.we, vertical: 18.he)),
          onPressed: () {},
          child: Row(
            children: [
              Container(
                width: 52.we,
                height: 52.we,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.c_E9E9E9,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SvgPicture.asset(cardModul.icon),
                    )
                  ],
                ),
              ),
              SizedBox(width: 16.we),
              _getRichText(cardModul.typeCard, cardModul.numberCard),
              const Spacer(),
              _getRichText(cardModul.money, cardModul.date, TextAlign.right),
            ],
          ),
        ),
        if(isNotEnd) Container(
          margin: EdgeInsets.symmetric(horizontal: 2.we),
          width: double.infinity,
          height: 1,
          color: AppColors.c_585858,
        ),
      ],
    );
  }

  Widget _getRichText(String title, String subTitle,
      [TextAlign textAlign = TextAlign.start]) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        text: "$title\n",
        style: TextStyle(
          color: AppColors.c_EEEEEE,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: subTitle,
            style: TextStyle(
              color: AppColors.c_EEEEEE.withOpacity(0.60),
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
