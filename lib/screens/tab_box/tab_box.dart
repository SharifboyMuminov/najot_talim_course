import 'package:default_project/screens/tab_box/widget/tab_bar_button.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(left: 25.we, right: 25.we, bottom: 30.he),
              padding: EdgeInsets.symmetric(horizontal: 10.we, vertical: 10.he),
              decoration: BoxDecoration(
                color: AppColors.c_333333.withOpacity(0.6),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TabBarButton(
                    onTab: () {},
                    iconPath: AppImages.qrCodeGenerate,
                    isActive: false,
                    title: "Generate",
                  ),
                  TabBarButton(
                    onTab: () {},
                    iconPath: AppImages.historyIcon,
                    isActive: true,
                    title: "Generate",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
