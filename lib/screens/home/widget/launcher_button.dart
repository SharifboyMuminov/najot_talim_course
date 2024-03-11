import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LauncherButton extends StatelessWidget {
  const LauncherButton(
      {super.key,
      required this.title,
      required this.isChek,
      required this.onTab});
  final String title;
  final bool isChek;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 10.we)),
        onPressed: onTab,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24.sp, color: Colors.black),
            ),
            if (isChek)
               Icon(
                Icons.check,
                color: Colors.black,
                size: 20.sp,
              ),
          ],
        ),
      ),
    );
  }
}
