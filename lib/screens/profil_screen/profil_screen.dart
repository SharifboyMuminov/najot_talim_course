import 'package:default_project/screens/profil_screen/widgets/users_button.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/local/local.dart';
import '../../utils/size.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key, this.onSet});

  final VoidCallback? onSet;

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.c_000000,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (widget.onSet != null) {
              widget.onSet!.call();
            }
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            AppImages.arrowBack,
          ),
        ),
        backgroundColor: AppColors.c_000000,
        centerTitle: true,
        title: Text(
          "Transactions",
          style: TextStyle(
              color: AppColors.c_F9F9F9,
              fontSize: 24.sp,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 30.he),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.we),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "From",
                    style: TextStyle(
                      color: AppColors.c_EEEEEE.withOpacity(0.80),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  15.getH(),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.c_7485B4,
                        padding: EdgeInsets.symmetric(vertical: 22.he),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Column(
                        children: [
                          Text(
                            "Account",
                            style: TextStyle(
                              color: AppColors.c_F9F9F9,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          5.getH(),
                          Text(
                            "00342745928",
                            style: TextStyle(
                              color: AppColors.c_F9F9F9,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  30.getH(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        3,
                        (index) {
                          return Container(
                            width: 14.we,
                            height: 14.we,
                            margin: EdgeInsets.symmetric(horizontal: 5.we),
                            decoration: BoxDecoration(
                              color: 0 == index
                                  ? AppColors.c_B1BEEC
                                  : AppColors.c_6C6C6C,
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  40.getH(),
                  Text(
                    "To",
                    style: TextStyle(
                      color: AppColors.c_EEEEEE.withOpacity(0.80),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  25.getH(),
                ],
              ),
            ),
            SizedBox(
              height: 90.he,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 58.we,
                      height: 58.we,
                      margin: EdgeInsets.symmetric(horizontal: 8.we),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.c_DBE3F8,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          weight: 19.we,
                        ),
                      ),
                    ),
                    ...List.generate(
                      contacts.length,
                      (index) {
                        return UsersButton(
                            contacModul: contacts[index], onTab: () {});
                      },
                    ),
                  ],
                ),
              ),
            ),
            40.getH(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.we),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Amount",
                    style: TextStyle(
                      color: AppColors.c_EEEEEE.withOpacity(0.80),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  30.getH(),
                  Text(
                    "\$0.00",
                    style: TextStyle(
                      color: AppColors.c_FFFFFF,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  ),
                  10.getH(),
                  Container(
                    width: double.infinity,
                    height: 1.he,
                    color: AppColors.c_626262,
                  ),
                  20.getH(),
                  Text(
                    "Purpose",
                    style: TextStyle(
                      color: AppColors.c_EEEEEE.withOpacity(0.80),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  30.getH(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Education",
                        style: TextStyle(
                          color: AppColors.c_FFFFFF,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/arrow_bottom.svg",
                        width: 18.we,
                        height: 11.he,
                      ),
                    ],
                  ),
                  10.getH(),
                  Container(
                    width: double.infinity,
                    height: 1.he,
                    color: AppColors.c_626262,
                  ),
                  50.getH(),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.he),
                        backgroundColor: AppColors.c_414A61,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Send",
                        style: TextStyle(
                          color: AppColors.c_F9F9F9,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
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
