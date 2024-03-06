import 'package:default_project/data/models/coffe_modul/coffe_modul.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem(
      {super.key, required this.coffeModul, required this.onTabAdd});
  final CoffeModul coffeModul;
  final VoidCallback onTabAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.we, vertical: 8.he),
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
              coffeModul.imageUr,
              width: 240.we,
              height: 276.he,
              fit: BoxFit.cover,
            ),
          ),
          10.getH(),
          Text(
            coffeModul.name,
            style: TextStyle(
              color: AppColors.c_FFFFFF,
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            coffeModul.subTitle,
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
                "home_screen.money"
                    .tr(args: [coffeModul.price.toString()]),
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
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
