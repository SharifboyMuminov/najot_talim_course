import 'dart:async';

import 'package:default_project/data/local/local_objescs.dart';
import 'package:default_project/data/models/categori/categori_modeul.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../data/local/local_data/local_database.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class AddCategoriy extends StatefulWidget {
  const AddCategoriy({super.key, required this.onSet});
  final Function onSet;

  @override
  State<AddCategoriy> createState() => _AddCategoriyState();
}

class _AddCategoriyState extends State<AddCategoriy> {
  Color color = Color(0xFF1D1D1D);
  CategoriModul categoriModul = CategoriModul.initialValue();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmoji = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _initCange() async {
    categiries.addAll(await LocalDatabase.getAllCategory());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.c_121212,
        centerTitle: false,
        title: Text(
          "Create new category",
          style: TextStyle(
            color: AppColors.c_FFFFFF.withOpacity(0.87),
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: AppColors.c_121212,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.we),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.getH(),
                  Text(
                    "Category name :",
                    style: TextStyle(
                      color: AppColors.c_FFFFFF.withOpacity(0.87),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  16.getH(),
                  TextField(
                    controller: controllerName,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(
                      color: AppColors.c_FFFFFF,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.we, vertical: 14.he),
                      filled: true,
                      fillColor: Color(0xFF1D1D1D),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                        borderSide:
                            BorderSide(color: AppColors.c_979797, width: 1.we),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                        borderSide:
                            BorderSide(color: AppColors.c_979797, width: 2.we),
                      ),
                      hintText: "Category name",
                      hintStyle: TextStyle(
                        color: AppColors.c_AFAFAF,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  20.getH(),
                  Text(
                    "Enter smail:",
                    style: TextStyle(
                      color: AppColors.c_FFFFFF.withOpacity(0.87),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  16.getH(),
                  SizedBox(
                    width: 50.we,
                    child: TextField(
                      controller: controllerEmoji,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: TextStyle(
                        color: AppColors.c_FFFFFF,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.we, vertical: 14.he),
                        filled: true,
                        fillColor: color,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.r),
                          borderSide: BorderSide(
                              color: AppColors.c_979797, width: 1.we),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.r),
                          borderSide: BorderSide(
                              color: AppColors.c_979797, width: 2.we),
                        ),
                      ),
                    ),
                  ),
                  20.getH(),
                  Text(
                    "Category color:",
                    style: TextStyle(
                      color: AppColors.c_FFFFFF.withOpacity(0.87),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  16.getH(),
                ],
              ),
            ),
            SizedBox(
              height: 80,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.we),
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(
                    colors.length,
                    (index) {
                      return ZoomTapAnimation(
                        onTap: () {
                          color = colors[index];
                          setState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.we),
                          width: 60.we,
                          height: 60.we,
                          decoration: BoxDecoration(
                            color: colors[index],
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            200.getH(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.we),
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15.he),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: AppColors.c_8687E7,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            15.getH(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 24.we),
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15.he),
                  backgroundColor: AppColors.c_8687E7,
                ),
                onPressed: () async {
                  categoriModul = categoriModul.copyWith(
                    title: controllerName.text,
                    color: color,
                    icon: controllerEmoji.text,
                  );
                  if (categoriModul.availabel()) {
                    await LocalDatabase.insertCategory(categoriModul);
                    _initCange();
                    widget.onSet.call();
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Create Category",
                  style: TextStyle(
                    color: AppColors.c_FFFFFF,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
