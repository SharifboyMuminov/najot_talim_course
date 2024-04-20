import 'package:default_project/data/local/local_varibals.dart';
import 'package:default_project/screens/generate/generate_screen.dart';
import 'package:default_project/screens/history/history_screen.dart';
import 'package:default_project/screens/scaner/scaner_screen.dart';
import 'package:default_project/screens/tab_box/widget/tab_bar_button.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  final List<Widget> _screens = const [
    GenerateScreen(),
    HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          _screens[globalActiveScreen],
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(left: 25.we, right: 25.we, bottom: 20.he),
              padding: EdgeInsets.symmetric(horizontal: 10.we, vertical: 10.he),
              decoration: BoxDecoration(
                color: AppColors.c_333333.withOpacity(0.6),
                borderRadius: BorderRadius.circular(9.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TabBarButton(
                    onTab: () {
                      globalActiveScreen = 0;
                      setState(() {});
                    },
                    iconPath: AppImages.qrCodeGenerate,
                    isActive: globalActiveScreen == 0,
                    title: "Generate",
                  ),
                  TabBarButton(
                    onTab: () {
                      globalActiveScreen = 1;
                      setState(() {});
                    },
                    iconPath: AppImages.historyIcon,
                    isActive: globalActiveScreen == 1,
                    title: "History",
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 70.he),
              decoration: BoxDecoration(
                color: AppColors.c_FDB623,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.c_FDB623,
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: AppColors.c_FDB623,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.r),
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ScannerScreen();
                      },
                    ),
                  );
                },
                child: SvgPicture.asset(AppImages.qrCode),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
