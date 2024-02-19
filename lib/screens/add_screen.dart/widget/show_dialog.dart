import 'package:default_project/screens/add_screen.dart/widget/alert_item.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AlertView extends StatelessWidget {
  const AlertView(
      {super.key, required this.onTabSave, required this.onTabDiscard});
  final VoidCallback onTabSave;
  final VoidCallback onTabDiscard;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      iconPadding: EdgeInsets.symmetric(vertical: 20.he),
      backgroundColor: AppColors.c_252525,
      title: const Text(
        "Save changes ?",
        style: TextStyle(
          color: AppColors.c_CFCFCF,
        ),
      ),
      icon: SvgPicture.asset(
        AppImages.undovBlackSvg,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.we),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DialogButton(
                  title: "Discard",
                  onTab: onTabDiscard,
                  backgroundColor: AppColors.c_FF0000),
              DialogButton(
                title: 'Save',
                onTab: onTabSave,
                backgroundColor: AppColors.c_30BE71,
              ),
            ],
          ),
        ),
      ],
      actionsPadding: EdgeInsets.symmetric(
        vertical: 30.he,
      ),
    );
  }
}
