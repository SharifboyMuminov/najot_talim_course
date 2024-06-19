import 'package:default_project/data/local/local_list/local.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  double sliderValue = 20;
  Color currentColor = myColors.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_252525,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width,
            height: 100,
            color: currentColor.withOpacity(
              double.parse(
                "0.${sliderValue.toInt() < 10 ? "0" : ""}${sliderValue.toInt()}",
              ),
            ),
          ),
          Wrap(
            children: [
              ...List.generate(
                myColors.length,
                (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.we,
                      vertical: 5.he,
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: myColors[index],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: () {
                        currentColor = myColors[index];
                        setState(() {});
                      },
                      child: SizedBox(
                        width: 50.we,
                        height: 50.we,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          20.getH(),
          Container(
            width: width,
            height: 50.he,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: List.generate(
                  99,
                  (index) {
                    return Colors.red.withOpacity(
                      double.parse(
                        "0.${index < 10 ? "0" : ""}$index",
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          40.getH(),
          Slider.adaptive(
            thumbColor: Colors.white,
            activeColor: currentColor,
            inactiveColor: AppColors.c_FFFFFF,
            value: sliderValue,
            max: 99,
            min: 5,
            onChanged: (v) {
              setState(() {
                sliderValue = v;
              });
            },
          ),
        ],
      ),
    );
  }
}
