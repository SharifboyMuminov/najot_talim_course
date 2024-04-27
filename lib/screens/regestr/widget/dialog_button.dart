import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogButtons extends StatelessWidget {
  const DialogButtons({super.key, required this.onTab, required this.iconData});

  final VoidCallback onTab;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 5.we, vertical: 5.we),
        side: BorderSide(color: Colors.deepPurple, width: 3.we),
      ),
      onPressed: onTab,
      child: Icon(
        iconData,
        size: 40.sp,
      ),
    );
  }
}
