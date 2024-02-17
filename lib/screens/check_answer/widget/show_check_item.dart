import 'package:default_project/screens/widgets/show_rezal.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowCheckView extends StatelessWidget {
  const ShowCheckView(
      {super.key,
      required this.trueAnswer,
      required this.questionTest,
      required this.isTrue,
      required this.selectedVariant,
      required this.number});
  final String questionTest;
  final String trueAnswer;
  final bool isTrue;
  final String selectedVariant;
  final int number;

  @override
  Widget build(BuildContext context) {
    return RezaltView(
      margin: EdgeInsets.symmetric(vertical: 10.he),
      pading: EdgeInsets.symmetric(horizontal: 20.we, vertical: 20.he),
      bacground: AppColors.c_162023,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            questionTest,
            style: TextStyle(
              color: AppColors.c_F2F2F2,
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20.he),
          Text(
            "True Answer.",
            style: TextStyle(
              color: AppColors.c_F2F2F2,
              fontSize: 18.sp,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 10.he),
            padding: EdgeInsets.symmetric(vertical: 20.he, horizontal: 10.we),
            decoration: BoxDecoration(
              color: AppColors.c_27AE60,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Text(
              trueAnswer,
              style: TextStyle(
                  color: AppColors.c_F2F2F2,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            "Your Answer.",
            style: TextStyle(
              color: AppColors.c_F2F2F2,
              fontSize: 18.sp,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 10.he),
            padding: EdgeInsets.symmetric(vertical: 20.he, horizontal: 10.we),
            decoration: BoxDecoration(
              color: isTrue ? AppColors.c_27AE60 : AppColors.c_EB5757,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    selectedVariant,
                    style: TextStyle(
                      color: AppColors.c_F2F2F2,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  number != -1
                      ? isTrue
                          ? Icons.check
                          : Icons.clear
                      : Icons.question_mark_outlined,
                  color: AppColors.c_F2F2F2,
                  size: 20,
                ),
                SizedBox(width: 5.we),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
