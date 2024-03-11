import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'widget/category.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activIndex = 0;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                floating: false,
                stretch: false,
                pinned: true,
                elevation: 0,
                // leading: IconButton(
                //   style: IconButton.styleFrom(
                //     backgroundColor: Colors.white,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10.r),
                //     ),
                //   ),
                //   onPressed: () {},
                //   icon: Icon(
                //     Icons.arrow_back,
                //     color: Colors.black,
                //   ),
                // ),
                // actions: [
                //   IconButton(
                //     style: IconButton.styleFrom(
                //       backgroundColor: Colors.white,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10.r),
                //       ),
                //     ),
                //     onPressed: () {},
                //     icon: Icon(
                //       Icons.more_horiz,
                //       color: Colors.black,
                //     ),
                //   ),
                // ],
                expandedHeight: 420,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 20.we, vertical: 20.he),
                    decoration: BoxDecoration(
                      color: AppColors.cF5F6FA,
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        80.getH(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.we),
                          child: Text(
                            "Balances",
                            style: TextStyle(
                              fontSize: 46.sp,
                              color: AppColors.c_151940,
                            ),
                          ),
                        ),
                        30.getH(),
                        SizedBox(
                          height: 138.he,
                          child: ListView(
                            padding: EdgeInsets.symmetric(horizontal: 17.we),
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              10,
                              (index) {
                                return Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 7.we),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.r)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.we, vertical: 20.he),
                                        backgroundColor: Colors.white),
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12.he,
                                              horizontal: 12.we),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: SvgPicture.asset(
                                              "assets/icons/evro.svg"),
                                        ),
                                        16.getH(),
                                        Text(
                                          "585.00",
                                          style: TextStyle(
                                            color: AppColors.c_151940,
                                            fontSize: 19.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "EUR Balance",
                                          style: TextStyle(
                                              color: AppColors.c_898A8D),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        30.getH(),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "See Balance Details",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.c_5771F9,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: CategoriyItem(
                    onChangeIndex: (int value) {
                      activIndex = value;
                      setState(() {});
                    },
                    activIndex: activIndex),
              ),
              SliverList.list(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.we),
                        child: Text(
                          "Today",
                          style: TextStyle(
                              color: Color(0xFF020000),
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ...List.generate(
                        10,
                        (index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 20.he),
                            child: ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 40.we),
                              leading: Container(
                                width: 65,
                                height: 65,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.we, horizontal: 5.we),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(15.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          AppColors.c_7A7AFD.withOpacity(0.1),
                                      blurRadius: 20,
                                      spreadRadius: 5,
                                      offset: Offset(0, 20),
                                    ),
                                  ],
                                ),
                                child: Image.asset("assets/images/logo_be.png"),
                              ),
                              title: Text(
                                "Behance Project",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.c_151940,
                                ),
                              ),
                              subtitle: Text(
                                "23rd march 2021",
                                style: TextStyle(
                                  color: AppColors.c_7F8192,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              trailing: Text(
                                "\$320",
                                style: TextStyle(
                                  color: AppColors.c_151940,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 60,
            left: 41,
            right: 41,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    backgroundColor: Colors.red
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
