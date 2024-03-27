import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddImageButton extends StatelessWidget {
  const AddImageButton({super.key, required this.onTab});
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        )),
        onPressed: onTab,
        child: Text(
          "Add iamge",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
