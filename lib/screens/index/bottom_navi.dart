import 'package:default_project/screens/index/add/add_screen.dart';
import 'package:default_project/screens/index/home/home_screen.dart';
import 'package:default_project/screens/index/home/widget/bttom_item.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';

class BottomNavigationCostym extends StatefulWidget {
  const BottomNavigationCostym({super.key});

  @override
  State<BottomNavigationCostym> createState() => _BottomNavigationCostymState();
}

class _BottomNavigationCostymState extends State<BottomNavigationCostym> {
  late List<Widget> _screens;
  int activIndex = 0;

  @override
  void initState() {
    _screens = const [
      HomeScreen(),
      AddScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: activIndex,
            children: _screens,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.only(
                  bottom: 30.he, top: 4.he, left: 25.we, right: 25.we),
              color: AppColors.c_353535,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomItem(
                    onTab: () {
                      activIndex = 0;
                      setState(() {});
                    },
                    title: 'Index',
                    icon: AppImages.index,
                  ),
                  BottomItem(
                    onTab: () {
                      activIndex = 1;
                      setState(() {});
                    },
                    title: "Profile",
                    icon: AppImages.profile,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 65.we,
        width: 65.we,
        child: FloatingActionButton(
          backgroundColor: AppColors.c_8687E7,
          onPressed: () {},
          child: SvgPicture.asset(
            AppImages.plus,
          ),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
