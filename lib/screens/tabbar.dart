import 'package:default_project/screens/category/category_screen.dart';
import 'package:default_project/screens/profile/profile_screen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view/tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'product/product_screen.dart';
import 'request/request_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  final List<Widget> _screens = const [
    CategoryScreen(),
    ProductScreen(),
    RequestScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    animation =
        Tween<double>(begin: -100.0, end: 0.0).animate(animationController);

    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provide = Provider.of<TabViewModel>(context, listen: false);
    var provideListen = Provider.of<TabViewModel>(context, listen: true);
    return Scaffold(
      body: Stack(
        children: [
          _screens[provideListen.activeScreen],
          Positioned(
            bottom: animation.value,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.we, vertical: 20.he),
              padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 10.he),
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
                  _getButton(
                    onTab: () {
                      provide.setActiveScreen(0);
                    },
                    icon: Icons.home,
                    active: provideListen.activeScreen == 0,
                  ),
                  _getButton(
                    onTab: () {
                      provide.setActiveScreen(1);
                    },
                    icon: Icons.shopping_basket,
                    active: provideListen.activeScreen == 1,
                  ),
                  _getButton(
                    onTab: () {
                      provide.setActiveScreen(2);
                    },
                    icon: Icons.request_page,
                    active: provideListen.activeScreen == 2,
                  ),
                  _getButton(
                    onTab: () {
                      provide.setActiveScreen(3);
                    },
                    icon: Icons.person,
                    active: provideListen.activeScreen == 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getButton(
      {required VoidCallback onTab,
      required IconData icon,
      required bool active}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onTab,
          icon: Icon(
            icon,
            size: 24.sp,
          ),
        ),
        if (active)
          Container(
            width: 5.we,
            height: 5.we,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
