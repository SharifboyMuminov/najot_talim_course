import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key, required this.onChange});

  final ValueChanged<String> onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.we, vertical: 5.he),
      child: TextFormField(
        onChanged: onChange,
        cursorHeight: 25.he,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 13.we, vertical: 13.he),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(color: Colors.black87, width: 1.we),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(color: Colors.black45, width: 1.we),
          ),
          hintText: "Seache",
          hintStyle: TextStyle(
            color: Colors.black54,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
