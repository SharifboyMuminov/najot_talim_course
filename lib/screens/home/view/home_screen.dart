import 'package:default_project/data/local/local_varibalse.dart';
import 'package:default_project/screens/home/quiz_controller.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widget/bacground_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final registerQuizController = Get.put(QuizController());
  late Animation<Alignment> animationAlign;

  void initState() {
    globalAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    animationAlign = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween(begin: Alignment.center, end: Alignment.centerLeft),
          weight: 40),
      TweenSequenceItem<Alignment>(
          tween: Tween(begin: Alignment.centerLeft, end: Alignment.center),
          weight: 40),
      TweenSequenceItem<Alignment>(
          tween: Tween(begin: Alignment.centerRight, end: Alignment.center),
          weight: 40),
    ]).animate(CurvedAnimation(
        parent: globalAnimationController, curve: Curves.decelerate));

    globalAnimationController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

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
        body: Stack(
          children: [
            const BacgroundImage(),
            GetBuilder<QuizController>(
              builder: (QuizController controller) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width,
                        height: 50.he,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.we,
                          vertical: 10.he,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          "${controller.activeIndex + 1}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 25.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 150.he),
                      Text(
                        controller.questions[controller.activeIndex].request,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600,
                          shadows: const [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 100,
                              spreadRadius: 100,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.he),
                      Align(
                        alignment: animationAlign.value,
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: List.generate(
                            controller.questions[controller.activeIndex]
                                .trueAnswer.length,
                            (index) {
                              if (controller.inoputText.length > index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5.we, vertical: 5.he),
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.we, vertical: 15.we),
                                        backgroundColor:
                                            Colors.blue.withOpacity(0.5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                        ),
                                        side: BorderSide(
                                            color: Colors.blueAccent,
                                            width: 2.we),
                                      ),
                                      onPressed: () {
                                        controller.removeInputAlpha(
                                            controller.inoputText[index]);
                                      },
                                      child: Text(
                                        controller.inoputText[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                );
                              }
                              return Container(
                                width: 55.we,
                                height: 57.we,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5.we, vertical: 5.he),
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.5),
                                  border: Border.all(
                                      color: Colors.blueAccent, width: 2.we),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 80.he),
                      Wrap(
                        direction: Axis.horizontal,
                        children: List.generate(
                          controller.questions[controller.activeIndex].alphabet
                              .length,
                          (index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5.we, vertical: 5.he),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.we, vertical: 15.we),
                                  backgroundColor: Colors.blue.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  side: BorderSide(
                                      color: Colors.blueAccent, width: 2.we),
                                ),
                                onPressed: () {
                                  controller.onChange(controller
                                      .questions[controller.activeIndex]
                                      .alphabet[index]);
                                },
                                child: Text(
                                  controller.questions[controller.activeIndex]
                                      .alphabet[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
