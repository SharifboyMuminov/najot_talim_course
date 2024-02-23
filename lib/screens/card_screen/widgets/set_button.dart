import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/moduls/recent_transactions.dart';
import '../../../utils/app_colors.dart';

class SetButton extends StatelessWidget {
  const SetButton(
      {super.key,
      required this.recentTransactions,
      required this.onTab,
      required this.isNotEnd});
  final RecentTransactions recentTransactions;
  final VoidCallback onTab;
  final bool isNotEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          onPressed: onTab,
          child: Row(
            children: [
              Container(
                width: 52.we,
                height: 52.we,
                decoration: const BoxDecoration(
                  color: AppColors.c_6A6A6A,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SvgPicture.asset(
                        recentTransactions.icon,
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.we),
              Expanded(
                child: Text(
                  recentTransactions.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.c_EEEEEE,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                weight: 10.we,
                color: const Color(0xFFD1D1D1),
              ),
            ],
          ),
        ),
        if (isNotEnd)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2.we),
            width: double.infinity,
            height: 1,
            color: AppColors.c_585858,
          ),
      ],
    );
  }
}
