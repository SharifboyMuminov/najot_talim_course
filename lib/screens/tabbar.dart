import 'package:default_project/screens/category/category_screen.dart';
import 'package:default_project/screens/profile/profile_screen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'product/product_screen.dart';
import 'request/request_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late AnimationController animationController;
  late Animation<double> animation;
  final List<Widget> _screens = const [
    CategoryScreen(),
    ProductScreen(),
    RequestScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var provide = Provider.of<TabViewModel>(context, listen: false);
    var provideListen = Provider.of<TabViewModel>(context, listen: true);
    return Scaffold(
      body: Stack(
        children: [
          _screens[provideListen.activeScreen],
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.we, vertical: 20.he),
              padding: EdgeInsets.symmetric(horizontal: 30.we, vertical: 5.he),
              decoration: BoxDecoration(
                color: AppColors.c_FFFFFF,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(

                    children: [
                      IconButton(
                        onPressed: () {
                          provide.setActiveScreen(0);
                        },
                        icon: Icon(Icons.home, size: 24.sp),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      provide.setActiveScreen(1);
                    },
                    icon: Icon(
                      Icons.shopping_basket,
                      size: 24.sp,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        provide.setActiveScreen(2);
                      },
                      icon: Icon(
                        Icons.request_page,
                        size: 24.sp,
                      )),
                  IconButton(
                    onPressed: () {
                      provide.setActiveScreen(3);
                    },
                    icon: Icon(
                      Icons.person,
                      size: 24.sp,
                    ),
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
