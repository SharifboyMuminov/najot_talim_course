import 'package:default_project/data/models/coffe_modul/coffe_modul.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/arrow_button.dart';
import 'widget/image_overide.dart';
import 'widget/size_item.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, required this.coffeModul, required this.onSet});
  final CoffeModul coffeModul;
  final VoidCallback onSet;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  CoffeModul coffeModul = CoffeModul.getDefault();
  int activIndex = 0;
  bool isFavorite = false;

  @override
  void initState() {
    coffeModul = widget.coffeModul;
    isFavorite = coffeModul.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_0C0F14,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.we, vertical: 30.he),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              width: 380.we,
              height: 544.he,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                    image: NetworkImage(coffeModul.imageUr), fit: BoxFit.cover),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ArrowButtonMy(),
                      IconButton(
                        onPressed: () {
                          isFavorite = !isFavorite;

                          setState(() {});
                        },
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                          size: 25.sp,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  ImageOverItem(
                    coffeModul: coffeModul,
                    onTabAdd: () {},
                  ),
                ],
              ),
            ),
            24.getH(),
            Text(
              "info_screen.description".tr(),
              style: TextStyle(
                color: AppColors.c_FFFFFF,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            10.getH(),
            Text(
              coffeModul.descreption,
              style: TextStyle(
                color: AppColors.c_FFFFFF.withOpacity(0.25),
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            24.getH(),
            Text(
              "info_screen.size".tr(),
              style: TextStyle(
                color: AppColors.c_FFFFFF,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            8.getH(),
            SizeItem(
              activIndex: activIndex,
              onTanM: () {
                activIndex = 1;
                setState(() {});
              },
              onTanL: () {
                activIndex = 2;
                setState(() {});
              },
              onTanS: () {
                activIndex = 0;
                setState(() {});
              },
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.he),
                  backgroundColor: AppColors.c_D17842,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                ),
                onPressed: () {},
                child: Text(
                  "info_screen.button_title_two".tr(),
                  style: TextStyle(
                    color: AppColors.c_FFFFFF,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
