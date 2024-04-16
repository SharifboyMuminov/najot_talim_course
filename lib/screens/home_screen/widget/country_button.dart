import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryButton extends StatelessWidget {
  const CountryButton({super.key, required this.onTab, required this.title});

  final VoidCallback onTab;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.we, vertical: 10.he),
      child: TextButton(
        onPressed: onTab,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 26.sp,
          ),
        ),
      ),
    );
  }
}
