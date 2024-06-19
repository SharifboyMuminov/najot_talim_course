import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowEmptyImage extends StatelessWidget {
  const ShowEmptyImage({super.key, required this.isSearhe});

  final bool isSearhe;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            isSearhe ? AppImages.emptySearche : AppImages.emptyImage,
            width: 350.we,
            height: 286.he,
          ),
        ),
        Text(
          isSearhe
              ? "File not found. Try searching again."
              : "Create your first note !",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.c_FFFFFF,
            fontSize: 20.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
