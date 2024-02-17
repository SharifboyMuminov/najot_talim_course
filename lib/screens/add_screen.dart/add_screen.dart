import 'package:default_project/screens/global_widget.dart/top_button.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  int lineTextFild1 = 1;
  int lineTextFild2 = 1;

  bool isRemove1 = false;
  bool isRemove2 = false;

  int lentheText1 = 0;
  int lentheText2 = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.c_252525,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.c_252525,
      ),
      child: Scaffold(
        backgroundColor: AppColors.c_252525,
        body: Column(
          children: [
            53.getH(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.we),
              child: Row(
                children: [
                  ButtonTop(
                    icon: AppImages.arrowBack,
                    onTab: () {},
                  ),
                  const Spacer(),
                  ButtonTop(icon: AppImages.look, onTab: () {}),
                  21.getW(),
                  ButtonTop(icon: AppImages.save, onTab: () {}),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 15.we),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (v) {
                        if (lentheText1 > v.length) {
                          isRemove1 = true;
                        } else {
                          isRemove1 = false;
                        }
                        lentheText1 = v.length;

                        if (v.length % 17 == 0 && !isRemove1) {
                          lineTextFild1++;
                        } else if (v.length % 17 == 0) {
                          lineTextFild1--;
                        }
                        if (v.isEmpty) {
                          lineTextFild1 = 1;
                        }
                        setState(() {});
                      },
                      cursorColor: AppColors.c_CCCCCC,
                      style: TextStyle(
                        color: AppColors.c_FFFFFF,
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: lineTextFild1,
                      decoration: InputDecoration(
                          hintText: "Title",
                          hintStyle: TextStyle(
                            color: AppColors.c_9A9A9A,
                            fontSize: 48.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide:
                                  BorderSide(color: AppColors.c_252525)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide:
                                  BorderSide(color: AppColors.c_252525))),
                    ),
                    TextField(
                      onChanged: (v) {
                        if (lentheText2 > v.length) {
                          isRemove2 = true;
                        } else {
                          isRemove2 = false;
                        }
                        lentheText2 = v.length;

                        if (v.length % 17 == 0 && !isRemove2) {
                          lineTextFild2++;
                        } else if (v.length % 17 == 0) {
                          lineTextFild2--;
                        }
                        if (v.isEmpty) {
                          lineTextFild2 = 1;
                        }
                        setState(() {});
                      },
                      cursorColor: AppColors.c_CCCCCC,
                      style: TextStyle(
                        color: AppColors.c_FFFFFF,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: lineTextFild2,
                      decoration: InputDecoration(
                          hintText: "Type something...",
                          hintStyle: TextStyle(
                            color: AppColors.c_9A9A9A,
                            fontSize: 23.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide:
                                  BorderSide(color: AppColors.c_252525)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide:
                                  BorderSide(color: AppColors.c_252525))),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
