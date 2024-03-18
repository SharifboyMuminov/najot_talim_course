import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/local/local_varibalse.dart';

class CategoriyItem extends SliverPersistentHeaderDelegate {
  const CategoriyItem({required this.activIndex, required this.onChangeIndex});
  final ValueChanged<int> onChangeIndex;
  final int activIndex;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.we),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
            categoriyText.length,
            (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5.we, vertical: 10.he),
                child: TextButton(
                  style: TextButton.styleFrom(
                    side: activIndex != index
                        ? const BorderSide(color: AppColors.c_939393, width: 1)
                        : null,
                    backgroundColor:
                        activIndex == index ? AppColors.c_404066 : null,
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.we, vertical: 10.he),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: () {
                    onChangeIndex.call(index);
                  },
                  child: Text(
                    categoriyText[index],
                    style: AppTextStyle.robotoMedium.copyWith(
                      color: activIndex == index
                          ? Colors.white
                          : AppColors.c_939393,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 64.0;

  @override
  double get minExtent => 64.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
