import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomshetItem extends StatelessWidget {
  const BottomshetItem(
      {super.key,
      required this.title,
      required this.onTab,
      required this.icons});

  final String title;
  final VoidCallback onTab;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      )),
      onPressed: onTab,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icons),
          SizedBox(
            width: 10.we,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
