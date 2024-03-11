import 'package:default_project/screens/home/widget/launcher_button.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/local/local_memory.dart';
import '../../data/network/tranlation.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String onchangeString = "";
  TextEditingController controller = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int activLauncher = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
      ),
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              110.getH(),
              LauncherButton(
                title: "🇺🇿  <->  🇬🇧",
                isChek: activLauncher == 0,
                onTab: () {
                  activLauncher = 0;
                  activLanguache.setEng();
                  setState(() {});
                },
              ),
              LauncherButton(
                title: "🇺🇿  <->  🇷🇺",
                isChek: activLauncher == 1,
                onTab: () {
                  activLanguache.setRu();
                  activLauncher = 1;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        key: _key,
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: AppColors.c_96E9C6,
          leading: IconButton(
            onPressed: () {
              _key.currentState!.openDrawer();
              setState(() {});
            },
            icon: SvgPicture.asset(
              "assets/icons/menu.svg",
              width: 22.we,
              colorFilter: ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                activLanguache.fromLanguchar,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                ),
              ),
              IconButton(
                onPressed: () {
                  activLanguache.changeLAngucher();
                  controller.clear();
                  setState(() {});
                },
                icon: Icon(
                  Icons.change_circle_outlined,
                  color: Colors.white,
                ),
              ),
              Text(
                activLanguache.toLanguage,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 10.he, horizontal: 20.we),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(5.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 30,
                        ),
                      ],
                    ),
                    child: TextField(
                      cursorColor: AppColors.c_96E9C6,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      controller: controller,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.clear();
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.clear,
                            color: AppColors.c_96E9C6,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.we, vertical: 15.he),
                        hintText: activLanguache.hintTextFrom,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide.none,
                        ),
                        helperStyle: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade100,
                        ),
                      ),
                      maxLines: null,
                      onChanged: (v) {
                        onchangeString = v;
                      },
                    ),
                  ),
                  20.getH(),
                  if (onchangeString.isNotEmpty)
                    FutureBuilder(
                      future: TransLation.getTranslation(onchangeString,
                          activLanguache.from, activLanguache.to),
                      builder: (context, snapshop) {
                        if (snapshop.hasError) {
                          return Text("Error :(");
                        }
                        if (snapshop.hasData) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.we, vertical: 10.he),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.c_96E9C6,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Text(
                              snapshop.data as String,
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }

                        return CircularProgressIndicator.adaptive();
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.he),
          padding: EdgeInsets.symmetric(horizontal: 8.we, vertical: 8.we),
          decoration: BoxDecoration(
            color: AppColors.c_96E9C6,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(
              Icons.send_sharp,
            ),
          ),
        ),
      ),
    );
  }
}
