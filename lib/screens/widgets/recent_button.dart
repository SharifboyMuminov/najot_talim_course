import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/moduls/recent_transactions.dart';
import '../../utils/app_colors.dart';

class RecentTransactionsButton extends StatelessWidget {
  const RecentTransactionsButton(
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
              padding:
                  EdgeInsets.symmetric(horizontal: 20.we, vertical: 18.he)),
          onPressed: onTab,
          child: Row(
            children: [
              Container(
                width: 52.we,
                height: 52.we,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: recentTransactions.bacgoundColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SvgPicture.asset(
                        recentTransactions.icon,
                        colorFilter: recentTransactions.colorFilter,
                      ),
                    )
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
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.c_EEEEEE,
                  ),
                ),
              ),
              Text(
                recentTransactions.money,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.c_EEEEEE,
                ),
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
