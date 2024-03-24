import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Rate extends StatelessWidget {
  const Rate({super.key, required this.rate});

  final String rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 5.we, vertical: 3.he),
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius:
          BorderRadius.circular(20.r)),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.white,
            size: 14.sp,
          ),
          SizedBox(width: 3.we),
          Text(
            rate,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
