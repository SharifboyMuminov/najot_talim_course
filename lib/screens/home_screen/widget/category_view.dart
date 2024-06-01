import 'package:default_project/data/local/local_varibals.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryView extends SliverPersistentHeaderDelegate {
  const CategoryView({required this.activeIndex, required this.onChangeIndex});

  final ValueChanged<int> onChangeIndex;
  final int activeIndex;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.we),
        scrollDirection: Axis.horizontal,
        children: [
          ...List.generate(
            globalCategoryModels.length,
            (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5.we, vertical: 10.he),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        activeIndex == index ? AppColors.c_7F8192 : null,
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.we, vertical: 10.he),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  onPressed: () {
                    onChangeIndex.call(index);
                  },
                  child: Row(
                    children: [
                      AnimatedContainer(
                        width: activeIndex == index ? 15.we : 10.we,
                        height: activeIndex == index ? 15.we : 10.we,
                        margin: EdgeInsets.only(right: 8.we),
                        decoration: BoxDecoration(
                          color: activeIndex == index
                              ? Colors.white
                              : AppColors.c_7F8192,
                          shape: BoxShape.circle,
                        ),
                        duration: const Duration(milliseconds: 500),
                      ),
                      AnimatedDefaultTextStyle(
                        style: TextStyle(
                          color: activeIndex == index
                              ? Colors.white
                              : AppColors.c_7F8192,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        duration: const Duration(milliseconds: 500),
                        child: Text(globalCategoryModels[index].title),
                      ),
                    ],
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