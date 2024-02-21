import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton(
      {super.key,
      required this.title,
      required this.urlImage,
      required this.onTab});

  final String title;
  final String urlImage;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10.he),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 10.we),
          backgroundColor: AppColors.c_FFFFFF,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        onPressed: onTab,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 100.he,
              width: 150.we,
              child: Image.network(urlImage),
            ),
          ],
        ),
      ),
    );
  }
}
