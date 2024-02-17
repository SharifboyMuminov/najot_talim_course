import 'package:default_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RezaltView extends StatelessWidget {
  const RezaltView(
      {super.key,
      required this.child,
      required this.pading,
      required this.bacground,
      this.isShowBorder = true,this.margin});

  final Widget child;
  final Color bacground;
  final EdgeInsets pading;
  final bool isShowBorder;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: margin,
        padding: pading,
        decoration: BoxDecoration(
          color: bacground,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isShowBorder ? AppColors.c_2F3739 : Colors.transparent,
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColors.c_162023,
              blurRadius: 7,
              spreadRadius: 1,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: child);
  }
}
