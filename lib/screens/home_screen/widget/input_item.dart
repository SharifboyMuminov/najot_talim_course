import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputAndAlphabetsButtons extends StatelessWidget {
  const InputAndAlphabetsButtons(
      {super.key, required this.onTab, required this.title});

  final VoidCallback onTab;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.we, vertical: 5.he),
      child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 15.we),
            backgroundColor: Colors.blue.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
            side: BorderSide(color: Colors.blueAccent, width: 2.we),
          ),
          onPressed: onTab,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
            ),
          )),
    );
  }
}
