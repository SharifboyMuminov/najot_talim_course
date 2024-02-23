import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MakeButton extends StatelessWidget {
  const MakeButton({super.key, required this.onTab});

  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.we),
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          padding: EdgeInsets.only(
              bottom: 22.he, top: 22.he, left: 26.we, right: 19.we),
          backgroundColor: AppColors.c_414A61,
        ),
        onPressed: onTab,
        child: Row(
          children: [
            Text(
              "Make a Payment",
              style: TextStyle(
                color: AppColors.c_FFFFFF,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            _getRichText("\$220", "Due: Feb 10, 2022", TextAlign.right),
          ],
        ),
      ),
    );
  }

  Widget _getRichText(String title, String subTitle,
      [TextAlign textAlign = TextAlign.start]) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        text: "$title\n",
        style: TextStyle(
          color: AppColors.c_FFFFFF,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: subTitle,
            style: TextStyle(
              color: AppColors.c_FFFFFF.withOpacity(0.76),
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
