import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryView extends SliverPersistentHeaderDelegate {
  const CategoryView({required this.activIndex, required this.onChangeIndex});

  final ValueChanged<int> onChangeIndex;
  final int activIndex;

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
            10,
            (index) {
              return AnimatedContainer(
                margin: EdgeInsets.symmetric(horizontal: 5.we, vertical: 10.he),
                duration: Duration(seconds: 1),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        activIndex == index ? AppColors.c_7F8192 : null,
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
                      Container(
                        width: 10.we,
                        height: 10.we,
                        margin: EdgeInsets.only(right: 8.we),
                        decoration: BoxDecoration(
                          color: activIndex == index
                              ? Colors.white
                              : AppColors.c_7F8192,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        "Payments${activIndex == index ? " | \$398" : ""}",
                        style: TextStyle(
                          color: activIndex == index
                              ? Colors.white
                              : AppColors.c_7F8192,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // AnimatedDefaultTextStyle(
                      //   child: Text(
                      //       "Payments${activIndex == index ? " | \$398" : ""}"),
                      //   style: TextStyle(
                      //     color: activIndex == index
                      //         ? Colors.white
                      //         : AppColors.c_7F8192,
                      //     fontSize: 12.sp,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      //   duration: Duration(milliseconds: 500),
                      // ),
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
