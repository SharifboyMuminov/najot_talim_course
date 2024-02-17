import 'package:default_project/moduls/subjec_modul.dart';
import 'package:default_project/screens/check_answer/widget/show_check_item.dart';
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
                      return ShowCheckView(
                        trueAnswer: subjectModul.questions[index].true_answer,
                        questionTest:
                            subjectModul.questions[index].question_test,
                        isTrue: trues[index],
                        selectedVariant: dic[index] != -1
                            ? subjectModul
                                .questions[index].variants[dic[index]!]
                            : "Tavakkalam qimadiz ey🫣...",
                        number: dic[index]!,
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
