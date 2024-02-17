import 'package:default_project/moduls/subjec_modul.dart';
import 'package:default_project/screens/widgets/global_appbar.dart';
import 'package:default_project/screens/widgets/show_rezal.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class CheckAnswerScreen extends StatefulWidget {
  const CheckAnswerScreen(
      {super.key,
      required this.subjectModul,
      required this.dicInt,
      required this.trues});
  final SubjectModul subjectModul;
  final Map<int, int> dicInt;
  final List<bool> trues;

  @override
  State<CheckAnswerScreen> createState() => _CheckAnswerScreenState();
}

class _CheckAnswerScreenState extends State<CheckAnswerScreen> {
  late SubjectModul subjectModul;
  Map<int, int> dic = {};
  late List<bool> trues;

  @override
  void initState() {
    subjectModul = widget.subjectModul;
    dic = widget.dicInt;
    trues = widget.trues;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_273032,
      body: Column(
        children: [
          SizedBox(height: 60.he),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.we),
            child: GlobalAppBar(
              title: "Check Answer",
              onTabArrow: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 10.he),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                  top: 5.he, left: 24.we, right: 24.we, bottom: 25.he),
              child: Column(
                children: [
                  ...List.generate(
                    subjectModul.questions.length,
                    (index) {
                      return RezaltView(
                        margin: EdgeInsets.symmetric(vertical: 10.he),
                        pading: EdgeInsets.symmetric(
                            horizontal: 20.we, vertical: 20.he),
                        bacground: AppColors.c_162023,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              subjectModul.questions[index].question_test,
                              style: TextStyle(
                                color: AppColors.c_F2F2F2,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 20.he),
                            Text(
                              "True Answer.",
                              style: TextStyle(
                                color: AppColors.c_F2F2F2,
                                fontSize: 18.sp,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(vertical: 10.he),
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.he, horizontal: 10.we),
                              decoration: BoxDecoration(
                                color: AppColors.c_27AE60,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Text(
                                subjectModul.questions[index].true_answer,
                                style: TextStyle(
                                    color: AppColors.c_F2F2F2,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Text(
                              "Your Answer.",
                              style: TextStyle(
                                color: AppColors.c_F2F2F2,
                                fontSize: 18.sp,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(vertical: 10.he),
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.he, horizontal: 10.we),
                              decoration: BoxDecoration(
                                color: trues[index]
                                    ? AppColors.c_27AE60
                                    : AppColors.c_EB5757,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      dic[index] != -1
                                          ? subjectModul.questions[index]
                                              .variants[dic[index]!]
                                          : "Tavakkalam qimadiz ey🫣...",
                                      style: TextStyle(
                                        color: AppColors.c_F2F2F2,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    dic[index] != -1
                                        ? trues[index]
                                            ? Icons.check
                                            : Icons.clear
                                        : Icons.question_mark_outlined,
                                    color: AppColors.c_F2F2F2,
                                    size: 20,
                                  ),
                                  SizedBox(width: 5.we),
                                ],
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
          ),
        ],
      ),
    );
  }
}
