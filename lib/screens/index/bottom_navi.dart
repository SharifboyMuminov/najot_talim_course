import 'package:default_project/screens/index/add/add_screen.dart';
import 'package:default_project/screens/index/home/home_screen.dart';
import 'package:default_project/screens/index/home/widget/bttom_item.dart';
import 'package:default_project/screens/index/widgets/text_filda_add.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
  bool isShowBottomDialog = false;
  TextEditingController controllerAdd = TextEditingController();
  TextEditingController controllerDecreption = TextEditingController();

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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 50.he),
              height: 65.we,
              width: 65.we,
              child: FloatingActionButton(
                backgroundColor: AppColors.c_8687E7,
                onPressed: () {
                  isShowBottomDialog = !isShowBottomDialog;
                  setState(() {});
                  // showModalBottomSheet(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(15.r),
                  //       topRight: Radius.circular(15.r),
                  //     ),
                  //   ),
                  //   context: context,
                  //   builder: (context) {
                  //     return Container(
                  //       height: 300,
                  //       child: Column(
                  //         children: [
                  //           TextField(),
                  //           TextField()

                  //         ],
                  //       ),
                  //     );
                  //   },
                  // );
                },
                child: SvgPicture.asset(
                  AppImages.plus,
                ),
              ),
            ),
          ),
          if (isShowBottomDialog)
            InkWell(
              onTap: () {
                isShowBottomDialog = !isShowBottomDialog;
                setState(() {});
              },
              child: Container(
                width: width,
                height: height,
                color: Colors.black45,
              ),
            ),
          if (isShowBottomDialog)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.we),
                width: width,
                height: 260,
                decoration: BoxDecoration(
                  color: AppColors.c_363636,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 10.he),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add Task",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: AppColors.c_FFFFFF.withOpacity(0.87),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      14.getH(),
                      AddtextFild(
                        controller: controllerAdd,
                        hintText: 'Title',
                        textInputAction: TextInputAction.next,
                      ),
                      10.getH(),
                      AddtextFild(
                        controller: controllerDecreption,
                        hintText: "Description",
                        textInputAction: TextInputAction.done,
                      ),
                      15.getH(),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppImages.time,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppImages.categoriy,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppImages.priorty,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppImages.save,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
