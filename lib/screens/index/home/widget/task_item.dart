import 'package:default_project/data/models/task/task_modul.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(
      {super.key,
      required this.taskModul,
      required this.onTab,
      required this.onChange,
      required this.onLongPrees});
  final TaskModul taskModul;
  final VoidCallback onTab;
  final ValueChanged<bool?> onChange;
  final VoidCallback onLongPrees;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 26.we, vertical: 8.he),
      decoration: BoxDecoration(
          color: taskModul.isDelet ? Colors.red : AppColors.c_363636,
          borderRadius: BorderRadius.circular(5.r)),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: taskModul.isDelet
              ? EdgeInsets.zero
              : EdgeInsets.symmetric(horizontal: 10.we, vertical: 13.he),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        ),
        onPressed: onTab,
        onLongPress: onLongPrees,
        child: taskModul.isDelet
            ? SizedBox(
                width: double.infinity,
                height: 90.we,
                child: const Center(
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Checkbox.adaptive(
                      value: taskModul.isChek,
                      onChanged: onChange,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 110.we,
                        child: Text(
                          taskModul.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.c_FFFFFF.withOpacity(0.87),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 7.he),
                      SizedBox(
                        width: 120.we,
                        child: Text(
                          "${taskModul.day}  ${taskModul.hourMinut}",
                          style: TextStyle(
                            color: AppColors.c_AFAFAF,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.we, vertical: 8.he),
                        decoration: BoxDecoration(
                            color: taskModul.categoriModul.color,
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Row(
                          children: [
                            Text(
                              maxLines: 1,
                              taskModul.categoriModul.icon,
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            5.getW(),
                            SizedBox(
                              width: 40.we,
                              child: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                taskModul.categoriModul.title,
                                style: TextStyle(
                                  color: AppColors.c_FFFFFF,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.we),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.we, vertical: 8.he),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                              color: AppColors.c_8687E7, width: 1.we),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppImages.priorty,
                              width: 14.we,
                              height: 14.we,
                            ),
                            Text(
                              taskModul.priority.toString(),
                              style: TextStyle(
                                color: AppColors.c_E8E8E8,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
