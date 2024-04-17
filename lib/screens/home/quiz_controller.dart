import 'package:default_project/data/local/local_varibalse.dart';
import 'package:default_project/data/models/quiz/quiz_model.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class QuizController extends GetxController {
  RxList<QuizModel> questions = localQuizs.obs;
  RxInt _activeIndex = 0.obs;
  RxList<String> inoputText = <String>[].obs;
  int errorCount = 0;

  int get activeIndex => _activeIndex.value;

  void onChange(String value) async {
    if (questions[activeIndex].trueAnswer.length != inoputText.length) {
      inoputText.add(value);
      questions[activeIndex].alphabet.remove(value);
      update();
      if (questions[activeIndex].trueAnswer.length == inoputText.length) {
        if (questions[activeIndex].trueAnswer == inoputText.join("")) {
          Get.showSnackbar(
            GetSnackBar(
              duration: const Duration(seconds: 1),
              messageText: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.we),
                child: Text(
                  "Tugri :)",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22.sp,
                  ),
                ),
              ),
              snackStyle: SnackStyle.GROUNDED,
            ),
          );
          if (activeIndex < questions.length - 1) {
            await Future.delayed(const Duration(seconds: 2), () {
              inoputText.value = [];
              _activeIndex.value++;
            });
          } else {
            Get.defaultDialog(
                title: "O'yin tugadi 🥳🥳🥳",
                content: Text(
                  "Bir epladiza :)",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                  ),
                ));
            await Future.delayed(const Duration(seconds: 2), () {
              inoputText.value = [];
              _activeIndex.value = 0;
              Get.back();
            });
          }
        } else {
          errorCount++;
          String valueError = "No'to'g'rin :(";
          if (errorCount > 2) {
            valueError = "Yahshiro o'ylang :)";
            errorCount = 0;
          }
          if (isStartAnimation) {
            globalAnimationController.reverse();
            isStartAnimation = false;
          } else {
            globalAnimationController.forward();
            isStartAnimation = true;
          }
          Get.showSnackbar(
            GetSnackBar(
              duration: const Duration(seconds: 1),
              snackStyle: SnackStyle.GROUNDED,
              backgroundColor:
                  valueError.length == 14 ? Colors.red : AppColors.c_303030,
              messageText: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.we),
                child: Text(
                  valueError,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22.sp,
                  ),
                ),
              ),
            ),
          );
        }
      }
      update();
    }
  }

  void removeInputAlpha(String value) {
    inoputText.remove(value);
    questions[activeIndex].alphabet.add(value);
    update();
  }
}
