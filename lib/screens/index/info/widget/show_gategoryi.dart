import 'package:default_project/data/models/task/task_modul.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';

class ShowCategoriy extends StatelessWidget {
  const ShowCategoriy({super.key, required this.taskModul});

  final TaskModul taskModul;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.we, vertical: 10.he),
          decoration: BoxDecoration(
            color: taskModul.categoriModul.color,
            shape: BoxShape.circle,
          ),
          child: Text(
            taskModul.categoriModul.icon,
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
        ),
        SizedBox(
          width: width / 2,
          child: Text(
            taskModul.categoriModul.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 17.sp,
              color: AppColors.c_FFFFFF,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
