import 'package:default_project/screens/tab_box_one.dart';
import 'package:default_project/screens/tab_box_two.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ControlScreen extends StatelessWidget {
  const ControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.c_000000,
                padding: EdgeInsets.symmetric(vertical: 20.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const TabBoxOne();
                    },
                  ),
                );
              },
              child: const Text("Tab box one"),
            ),
          ),
          SizedBox(height: 15.h),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.c_000000,
                padding: EdgeInsets.symmetric(vertical: 20.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const TabBoxTwo();
                    },
                  ),
                );
              },
              child: const Text("Tab box two"),
            ),
          ),
          SizedBox(height: 15.h),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.c_000000,
                padding: EdgeInsets.symmetric(vertical: 20.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
              ),
              onPressed: () {},
              child: const Text("Tab box three"),
            ),
          ),
        ],
      ),
    );
  }
}
