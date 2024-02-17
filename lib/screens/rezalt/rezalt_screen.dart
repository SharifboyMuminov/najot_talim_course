import 'package:default_project/moduls/subjec_modul.dart';
import 'package:default_project/screens/check_answer/check_answer_screen.dart';
import 'package:default_project/screens/widgets/global_appbar.dart';
import 'package:default_project/screens/widgets/show_rezal.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/show_rezalt_true_count.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class RezaltScreen extends StatefulWidget {
  const RezaltScreen(
      {super.key, required this.dic, required this.subjectModul});
  final Map<int, int> dic;
  final SubjectModul subjectModul;

  @override
  State<RezaltScreen> createState() => _RezaltScreenState();
}

class _RezaltScreenState extends State<RezaltScreen> {
  late Map<int, int> dic;
  late SubjectModul subjectModul;
  late int trueCount;
  late List<bool> trues;
  bool isStop = false;

  @override
  void initState() {
    dic = widget.dic;
    trues = [];
    subjectModul = widget.subjectModul;
    trueCount = 0;
    for (int i = 0; i < dic.length; i++) {
      if (dic[i] != -1 &&
          subjectModul.questions[i].variants[dic[i]!] ==
              subjectModul.questions[i].true_answer) {
        trues.add(true);
        trueCount++;
      } else {
        trues.add(false);
      }
    }

    Future.delayed(const Duration(seconds: 2), () {
      isStop = true;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_273032,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.we),
        child: Column(
          children: [
            SizedBox(height: 50.he),
            GlobalAppBar(
              title: "Quiz Result",
              onTabArrow: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 22.he),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RezaltView(
                      pading: EdgeInsets.symmetric(
                          horizontal: 20.we, vertical: 16.he),
                      bacground: AppColors.c_162023,
                      child: Column(
                        children: [
                          Text(
                            subjectModul.name,
                            style: TextStyle(
                              color: AppColors.c_F2F2F2,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 19.he),
                    RezaltView(
                      pading: EdgeInsets.symmetric(
                          horizontal: 20.we, vertical: 20.he),
                      bacground: AppColors.c_162023,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 110.we,
                            width: 110.we,
                            child: CircularProgressIndicator(
                              value: isStop
                                  ? trueCount / subjectModul.questions.length
                                  : null,
                              backgroundColor:
                                  const Color(0xFFF2954D).withOpacity(.5),
                              strokeWidth: 5.w,
                              color: const Color(0xFFF2954D),
                            ),
                          ),
                          if (isStop)
                            Positioned(
                              top: (70 / 3).toInt().we,
                              left: (70 / 3).toInt().we,
                              child: Column(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: trueCount.toString(),
                                      style: TextStyle(
                                          color: AppColors.c_F2F2F2,
                                          fontSize: 27.sp,
                                          fontWeight: FontWeight.w600),
                                      children: [
                                        TextSpan(
                                          text:
                                              "/ ${subjectModul.questions.length}",
                                          style: TextStyle(
                                            color: AppColors.C_BDBDBD,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "Your Score",
                                    style: TextStyle(
                                      color: AppColors.C_BDBDBD,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 19.he),
                    ShowEndRezalt(
                      countTrue: trueCount,
                      countQuets: subjectModul.questions.length - trueCount,
                      isStop: isStop,
                    ),
                    SizedBox(height: 30.he),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15.he),
                          backgroundColor: AppColors.c_F2954D.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          side: BorderSide(
                              color: AppColors.c_F2954D, width: 1.we),
                        ),
                        onPressed: () {
                          if (isStop) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return CheckAnswerScreen(
                                    subjectModul: subjectModul,
                                    dicInt: dic,
                                    trues: trues,
                                  );
                                },
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Check Answers",
                          style: TextStyle(
                            color: AppColors.c_F2F2F2,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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

  @override
  void dispose() {
    super.dispose();
  }
}