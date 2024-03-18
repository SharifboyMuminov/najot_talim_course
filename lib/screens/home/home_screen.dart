import 'package:default_project/utils/size.dart';
import 'package:default_project/view_model/calculation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';
import 'widget/calculation_button.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    var providerListen = Provider.of<CalculatorViewModel>(context);
    var provider = Provider.of<CalculatorViewModel>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.he),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                providerListen.text,
                style: TextStyle(
                  fontSize: 24.sp,
                  color: AppColors.c_000000,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                providerListen.result,
                style: TextStyle(
                  fontSize: 28.sp,
                  color: AppColors.c_000000,
                ),
              ),
            ),
            Container(
              width: width,
              height: height / 1.6,
              padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 20.he),
              decoration: BoxDecoration(
                color: Color(0xFFE9F6FF),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CalculationButton(
                          onTab: () {
                            provider.clearText();
                          }, title: "C", color: AppColors.c_FF6060),
                      CalculationButton(
                          onTab: () {
                            provider.addText("%");

                          }, title: "%", color: AppColors.c_00B0D7),
                      CalculationButton(
                        onTab: () {
                          provider.deleteOne();
                        },
                        title: "C",
                        color: AppColors.c_00B0D7,
                        isSvg: true,
                      ),
                      CalculationButton(
                          onTab: () {
                            provider.addText("/");

                          }, title: "/", color: AppColors.c_00B0D7),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CalculationButton(
                        title: "7",
                        color: AppColors.c_000000,
                        onTab: () {
                          provider.addText("7");
                        },
                      ),
                      CalculationButton(
                        title: "8",
                        color: AppColors.c_000000,
                        onTab: () {
                          provider.addText("8");

                        },
                      ),
                      CalculationButton(
                        title: "9",
                        color: AppColors.c_000000,
                        onTab: () {
                          provider.addText("9");

                        },
                      ),
                      CalculationButton(
                        title: "X",
                        color: AppColors.c_00B0D7,
                        onTab: () {
                          provider.addText("*");

                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CalculationButton(
                        title: "4",
                        color: AppColors.c_000000,
                        onTab: () {
                          provider.addText("4");

                        },
                      ),
                      CalculationButton(
                        title: "5",
                        color: AppColors.c_000000,
                        onTab: () {
                          provider.addText("5");

                        },
                      ),
                      CalculationButton(
                        title: "6",
                        color: AppColors.c_000000,
                        onTab: () {
                          provider.addText("6");

                        },
                      ),
                      CalculationButton(
                        title: "-",
                        color: AppColors.c_00B0D7,
                        onTab: () {
                          provider.addText("-");

                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CalculationButton(
                        title: "1",
                        color: AppColors.c_000000,
                        onTab: () {
                          provider.addText("1");

                        },
                      ),
                      CalculationButton(
                        title: "2",
                        color: AppColors.c_000000,
                        onTab: () {
                          provider.addText("2");

                        },
                      ),
                      CalculationButton(
                        title: "3",
                        color: AppColors.c_000000,
                        onTab: () {
                          provider.addText("3");

                        },
                      ),
                      CalculationButton(
                        title: "+",
                        color: AppColors.c_00B0D7,
                        onTab: () {
                          provider.addText("+");

                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CalculationButton(
                        title: ".",
                        color: AppColors.c_000000,
                        onTab: () {
                          provider.addText(".");

                        },
                      ),
                      CalculationButton(
                        title: "0",
                        color: AppColors.c_000000,
                        onTab: () {
                          provider.addText("0");

                        },
                      ),
                      CalculationButton(
                        title: "",
                        color: AppColors.c_000000,
                        onTab: () {},
                        isSvg: true,
                        icon: "assets/icons/hot_res.svg",
                      ),
                      CalculationButton(
                        title: "=",
                        color: AppColors.c_00B0D7,
                        onTab: () {
                          provider.natija();
                        },
                      ),
                    ],
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
