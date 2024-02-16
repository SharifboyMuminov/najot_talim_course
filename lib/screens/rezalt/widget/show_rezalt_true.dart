import 'package:default_project/screens/rezalt/widget/show_rezal.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowEndRezalt extends StatelessWidget {
  const ShowEndRezalt(
      {super.key,
      required this.countTrue,
      required this.countQuets,
      required this.isStop});

  final int countTrue;
  final int countQuets;
  final bool isStop;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RezaltView(
            isShowBorder: false,
            pading: EdgeInsets.symmetric(horizontal: 16.we, vertical: 12.he),
            bacground: AppColors.c_27AE60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isStop ? countTrue.toString() : "^_^",
                  style: TextStyle(
                    color: AppColors.c_F2F2F2,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Correct Answers",
                  style: TextStyle(
                    color: AppColors.c_F2F2F2,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 16.we),
        Expanded(
          child: RezaltView(
            isShowBorder: false,
            pading: EdgeInsets.symmetric(horizontal: 16.we, vertical: 12.he),
            bacground: AppColors.c_EB5757,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isStop ? countQuets.toString() : "^_^",
                  style: TextStyle(
                    color: AppColors.c_F2F2F2,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Wrong Answesrs",
                  style: TextStyle(
                    color: AppColors.c_F2F2F2,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
