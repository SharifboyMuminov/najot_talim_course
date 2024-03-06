import 'package:default_project/data/local/local_variables/local_variables.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c_0C0F14,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/menu.svg",
            width: 18.we,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/searche.svg",
              width: 18.we,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/favorite.svg",
              width: 18.we,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.c_0C0F14,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (coffeFavorite.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.we),
                child: Text(
                  "home_screen.favorite".tr(),
                  style: TextStyle(
                    color: AppColors.c_FFFFFF,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            16.getH(),
            SizedBox(
              height: 430.he,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(
                    coffeFavorite.length,
                    (index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.we, vertical: 8.he),
                        margin: EdgeInsets.symmetric(horizontal: 12.we),
                        decoration: BoxDecoration(
                          color: AppColors.c_FFFFFF.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.network(
                                coffeFavorite[index].imageUr,
                                width: 240.we,
                                height: 276.he,
                                fit: BoxFit.cover,
                              ),
                            ),
                            10.getH(),
                            Text(
                              coffeFavorite[index].name,
                              style: TextStyle(
                                color: AppColors.c_FFFFFF,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              coffeFavorite[index].subTitle,
                              style: TextStyle(
                                color: AppColors.c_FFFFFF.withOpacity(0.50),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "home_screen.money".tr(args: [
                                    coffeFavorite[index].price.toString()
                                  ]),
                                  style: TextStyle(
                                    color: AppColors.c_D17842,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 55.we,
                                  width: 55.we,
                                  child: FloatingActionButton(
                                    backgroundColor: AppColors.c_D17842,
                                    onPressed: () {},
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
