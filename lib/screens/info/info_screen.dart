import 'package:default_project/data/local/local_data/local_data.dart';
import 'package:default_project/data/local/local_variables/local_variables.dart';
import 'package:default_project/data/models/coffe_modul/coffe_modul.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/arrow_button.dart';
import 'widget/image_overide.dart';
import 'widget/size_item.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, required this.coffeModul, required this.onSet});
  final CoffeModul coffeModul;
  final VoidCallback onSet;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  late CoffeModul coffeModul;
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
                      ArrowButtonMy(
                        onTab: () async {
                          if (isFavorite) {
                            if (!coffeFavorite.contains(coffeModul)) {
                              coffeModul.isFavorite = isFavorite;
                              await LocalDatabase.insertFavoriteCoffe(
                                  coffeModul);
                            }
                          } else {
                            if (coffeModul.id != null) {
                              await LocalDatabase.deleteFavoriteCoffe(
                                  coffeModul.id!);
                            }
                          }
                          if (context.mounted) {
                            widget.onSet.call();
                            Navigator.pop(context);
                          }
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          isFavorite = !isFavorite;
                          coffeModul.isFavorite = isFavorite;

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
                  const Spacer(),
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
            const Spacer(),
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
