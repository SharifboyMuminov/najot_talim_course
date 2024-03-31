import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({super.key, required this.onTab, required this.icon});

  final VoidCallback onTab;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.we, bottom: 20.he),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(15),
          backgroundColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
        onPressed: onTab,
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
