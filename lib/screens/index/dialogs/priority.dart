import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

getPriorityDialog(
    {required BuildContext context,
    required ValueChanged<int> onChange,
    required int i}) {
  int activPriopt = i;
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.we, vertical: 225),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.r),
              ),
              color: AppColors.c_363636,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 7.he),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 11.we,
                      ),
                      child: Text(
                        "Task Priority",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.c_FFFFFF.withOpacity(0.87),
                        ),
                      ),
                    ),
                    10.getH(),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 11.we,
                      ),
                      width: double.infinity,
                      height: 1,
                      color: AppColors.c_979797,
                    ),
                    10.getH(),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(vertical: 7.he),
                        child: Wrap(
                          children: [
                            ...List.generate(
                              10,
                              (index) => Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 9.we, vertical: 10.he),
                                decoration: BoxDecoration(
                                  color: (activPriopt == index + 1)
                                      ? AppColors.c_8687E7
                                      : AppColors.c_272727,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      activPriopt = index + 1;
                                    });
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        AppImages.priorty,
                                        width: 24.we,
                                        height: 24.we,
                                      ),
                                      Text(
                                        (index + 1).toString(),
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.c_FFFFFF
                                              .withOpacity(0.87),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: width / 2.8,
                          margin: EdgeInsets.symmetric(horizontal: 8.we),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 12.he),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.r),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: AppColors.c_8687E7,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: width / 2.8,
                          margin: EdgeInsets.symmetric(horizontal: 8.we),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 12.he),
                              backgroundColor: AppColors.c_8687E7,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.r),
                              ),
                            ),
                            onPressed: () {
                              onChange.call(activPriopt);
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(
                                color: AppColors.c_FFFFFF,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
