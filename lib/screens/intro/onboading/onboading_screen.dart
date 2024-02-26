import 'package:default_project/screens/widgets/global_text_button.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/local/local_objescs.dart';
import '../../routes.dart';

class OnboadingScreen extends StatefulWidget {
  const OnboadingScreen({super.key});

  @override
  State<OnboadingScreen> createState() => _OnboadingScreenState();
}

class _OnboadingScreenState extends State<OnboadingScreen> {
  int activIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.c_121212,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 15.he),
          child: Column(
            children: [
              60.getH(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.we),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutName.startScreen);
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: AppColors.c_FFFFFF.withOpacity(0.44),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.we),
                child: Column(
                  children: [
                    SizedBox(
                      height: 330.he,
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: pageController,
                        children: [
                          ...List.generate(
                            onboadingModuls.length,
                            (index) {
                              return Image.asset(
                                onboadingModuls[index].image,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    50.getH(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          onboadingModuls.length,
                          (index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 4.we),
                              width: 26.we,
                              height: 4.he,
                              decoration: BoxDecoration(
                                color: activIndex == index
                                    ? AppColors.c_FFFFFF.withOpacity(0.87)
                                    : AppColors.c_AFAFAF,
                                borderRadius: BorderRadius.circular(56.r),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    50.getH(),
                    Text(
                      onboadingModuls[activIndex].title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.c_FFFFFF.withOpacity(0.87),
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    42.getH(),
                    Text(
                      onboadingModuls[activIndex].subTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.c_FFFFFF.withOpacity(0.87),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              50.getH(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.we),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (activIndex != 0) {
                          activIndex--;
                          pageController.jumpToPage(activIndex);
                          setState(() {});
                        }
                      },
                      child: Text(
                        "Back",
                        style: TextStyle(
                          color: AppColors.c_FFFFFF.withOpacity(0.44),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    GlobalTextButton(
                      text: "Next",
                      pading: EdgeInsets.symmetric(
                          horizontal: 24.we, vertical: 12.he),
                      onTab: () {
                        if (activIndex != onboadingModuls.length - 1) {
                          activIndex++;
                          pageController.jumpToPage(activIndex);
                          setState(() {});
                        } else {
                          Navigator.pushNamed(context, RoutName.startScreen);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
