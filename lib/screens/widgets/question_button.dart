import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class QuestionButton extends StatelessWidget {
  const QuestionButton(
      {super.key,
      this.text1 = "Already have an account ?",
      this.text2 = "Login",
      required this.onTab});
  final String text1;
  final String text2;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(
              color: AppColors.c_FBDF00,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400),
        ),
        TextButton(
          onPressed: onTab,
          child: Text(
            text2,
            style: TextStyle(
                color: AppColors.c_FBDF00,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
