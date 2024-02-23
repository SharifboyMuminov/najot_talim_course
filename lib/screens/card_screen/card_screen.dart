import 'package:default_project/data/local/local.dart';
import 'package:default_project/screens/card_screen/widgets/set_button.dart';
import 'package:default_project/screens/widgets/my_contenir.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/size.dart';
import 'widgets/card_view.dart';
import 'widgets/make_button.dart';
import '../widgets/menu_button.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class CaardScreen extends StatefulWidget {
  const CaardScreen({super.key});

  @override
  State<CaardScreen> createState() => _CaardScreenState();
}

class _CaardScreenState extends State<CaardScreen> {
  int activIndex = 0;
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.c_000000,
      body: Column(
        children: [
          46.getH(),
          Text(
            "My Cards",
            style: TextStyle(
                color: AppColors.c_F9F9F9,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  48.getH(),
                  SizedBox(
                    width: double.infinity,
                    height: 160.he,
                    child: PageView(
                      onPageChanged: (index) {
                        setState(() {
                          activIndex = index;
                        });
                      },
                      children: [
                        ...List.generate(
                          cardModuls.length,
                          (index) {
                            return CardView(
                              cardModul: cardModuls[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  19.getH(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        cardModuls.length,
                        (index) {
                          return Container(
                            width: 14.we,
                            height: 14.we,
                            margin: EdgeInsets.symmetric(horizontal: 5.we),
                            decoration: BoxDecoration(
                              color: activIndex == index
                                  ? AppColors.c_B1BEEC
                                  : AppColors.c_6C6C6C,
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  33.getH(),
                  MakeButton(onTab: () {}),
                  48.getH(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        myCardsButtonText.length,
                        (index) {
                          return MenuButton(
                            onTab: () {
                              setState(() {
                                selectIndex = index;
                              });
                            },
                            title: myCardsButtonText[index],
                            isNotActiv: selectIndex == index,
                          );
                        },
                      ),
                    ],
                  ),
                  41.getH(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.we),
                    child: MyConterin(
                      child: Column(
                        children: [
                          ...List.generate(
                            myCardRecentTransactions.length,
                            (index) {
                              return SetButton(
                                recentTransactions:
                                    myCardRecentTransactions[index],
                                onTab: () {},
                                isNotEnd: index + 1 !=
                                    myCardRecentTransactions.length,
                              );
                            },
                          ),
                        ],
                      ),
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
