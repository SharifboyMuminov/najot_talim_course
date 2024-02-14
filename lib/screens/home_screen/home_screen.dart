import 'package:default_project/screens/home_screen/widgets/button_top.dart';
import 'package:default_project/screens/home_screen/widgets/item_note.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Model> str = [
    // Model(name: "Palonchi Palonchiyev", text: "asdfa"),
    // Model(name: "Palonchi Palonchiyev", text: "asdfa"),
    // Model(name: "Palonchi Palonchiyev", text: "asdfa"),
    // Model(name: "Palonchi Palonchiyev", text: "asdfa"),
    // Model(name: "Palonchi Palonchiyev", text: "asdfa"),
    // Model(name: "Palonchi Palonchiyev", text: "asdfa"),
    // Model(name: "Palonchi Palonchiyev", text: "asdfa"),
    // Model(name: "Palonchi Palonchiyev", text: "asdfa"),
    // Model(name: "Palonchi Palonchiyev", text: "asdfa"),
    // Model(name: "Palonchi Palonchiyev", text: "asdfa"),
    // Model(name: "Palonchi Palonchiyev", text: "asdfa"),
  ];

  bool showSearche = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.c_252525,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.c_252525,
      ),
      child: Scaffold(
        backgroundColor: AppColors.c_252525,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.we),
          child: Column(
            children: [
              showSearche ? 88.getH() : 55.getH(),
              if (showSearche)
                TextField(
                  style: TextStyle(
                    color: AppColors.c_CCCCCC,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 30.we, vertical: 12.he),
                    filled: true,
                    fillColor: AppColors.c_3B3B3B,
                    hintText: "Searche",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide(color: AppColors.c_3B3B3B),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide(color: AppColors.c_3B3B3B),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showSearche = false;
                        });
                      },
                      icon: SvgPicture.asset(AppImages.xmark),
                    ),
                  ),
                ),
              if (!showSearche)
                Row(
                  children: [
                    Text(
                      "Notes",
                      style: TextStyle(
                        color: AppColors.c_FFFFFF,
                        fontSize: 43.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    ButtonTop(
                        icon: AppImages.searcheSvg,
                        onTab: () {
                          setState(() {
                            showSearche = true;
                          });
                        }),
                    21.getW(),
                    ButtonTop(icon: AppImages.undovSvg, onTab: () {}),
                  ],
                ),
              15.getH(),
              if (str.isNotEmpty)
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        ...List.generate(
                          str.length,
                          (index) {
                            return ItemNoteButton(
                              isActivRemove: str[index].isRemove,
                              onTab: () {
                                if (str[index].isRemove) {
                                  setState(() {
                                    str.remove(str[index]);
                                  });
                                }
                              },
                              onLongPress: () {
                                setState(() {
                                  str[index].isRemove = !str[index].isRemove;
                                });
                              },
                              item: str[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              if (str.isEmpty) 182.getH(),
              if (str.isEmpty)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        AppImages.emptyImage,
                        width: 350.we,
                        height: 286.he,
                      ),
                    ),
                    Text(
                      "Create your first note !",
                      style: TextStyle(
                        color: AppColors.c_FFFFFF,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.c_252525,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.plus),
          ),
        ),
      ),
    );
  }
}

class Model {
  String name;
  String text;
  bool isRemove;

  Model({
    this.isRemove = false,
    required this.name,
    required this.text,
  });
}
