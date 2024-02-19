import 'package:default_project/moduls/subjec_modul.dart';
import 'package:default_project/screens/quiz_star/widgets/variants_item.dart';
import 'package:default_project/screens/rezalt/rezalt_screen.dart';
import 'package:default_project/screens/widgets/global_appbar.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/bottom_view.dart';

class QuizStartScreen extends StatefulWidget {
  const QuizStartScreen({super.key, required this.subjectModul});
  final SubjectModul subjectModul;

  @override
  State<QuizStartScreen> createState() => _QuizStartScreenState();
}

class _QuizStartScreenState extends State<QuizStartScreen> {
  late SubjectModul subjectModul;
  Map<int, int> dic = {};

  @override
  void initState() {
    subjectModul = widget.subjectModul;
    _timerLogic();
    for (int i = 0; i < subjectModul.questions.length; i++) {
      dic[i] = -1;
    }
    super.initState();
  }

  int quizIndex = 0;
  int activIndex = -1;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.c_273032,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.we),
            child: Column(
              children: [
                SizedBox(height: 50.he),
                GlobalAppBar(
                  title: "Quiz",
                  onTabArrow: () {},
                  widget: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.we, vertical: 13.he),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      side:
                          const BorderSide(color: AppColors.c_F2954D, width: 1),
                    ),
                    onPressed: () {
                      dic[quizIndex] = activIndex;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return RezaltScreen(
                                dic: dic, subjectModul: subjectModul);
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: AppColors.c_F2F2F2,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.he),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${subjectModul.name}/ Real Numbres",
                      style: TextStyle(
                        color: AppColors.c_F2F2F2.withOpacity(0.6),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      _getMinutText(count),
                      style: TextStyle(
                        color: AppColors.c_F2F2F2,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.he),
                LinearProgressIndicator(
                  minHeight: 8.he,
                  backgroundColor: AppColors.c_2F3739,
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.c_F2954D,
                  value: count / (subjectModul.questions.length * 10),
                ),
                SizedBox(height: 30.he),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.c_162023,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.we, vertical: 20.he),
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _getRichText(),
                            SizedBox(width: double.infinity, height: 12.he),
                            Text(
                              "${subjectModul.questions[quizIndex].question_test}",
                              style: TextStyle(
                                color: AppColors.c_F2F2F2,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 24.he),
                            ...List.generate(
                              subjectModul.questions[quizIndex].variants.length,
                              (index) {
                                return VariantsItem(
                                  title: subjectModul
                                      .questions[quizIndex].variants[index],
                                  isActiv: activIndex == index,
                                  onTab: () {
                                    activIndex = index;
                                    setState(() {});
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ButtomView(
                    onTabNext: () {
                      dic[quizIndex] = activIndex;
                      quizIndex++;
                      activIndex = dic[quizIndex]!;
                      setState(() {});
                    },
                    onTabPrevious: () {
                      if (quizIndex == subjectModul.questions.length - 1) {
                        dic[quizIndex] = activIndex;
                      }
                      quizIndex--;
                      activIndex = dic[quizIndex]!;
                      setState(() {});
                    },
                    showPrevious: quizIndex != 0,
                    showNext: quizIndex < subjectModul.questions.length - 1,
                  ),
                  SizedBox(height: 20.he),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  RichText _getRichText() {
    return RichText(
      text: TextSpan(
        text: "Q.${quizIndex + 1}",
        style: TextStyle(
          color: AppColors.c_F2F2F2,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: "/ ${subjectModul.questions.length}",
            style: TextStyle(
              color: AppColors.c_F2F2F2,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  String _getMinutText(int second) {
    String minutStr = (second ~/ 60).toString();
    String secondStr = (second % 60).toString();

    minutStr = minutStr.length <= 1 ? "0$minutStr" : minutStr;
    secondStr = secondStr.length <= 1 ? "0$secondStr" : secondStr;

    return "$minutStr : $secondStr";
  }

  Future<void> _timerLogic() async {
    for (int i = subjectModul.questions.length * 10; i > 0; i--) {
      setState(() {
        count = i;
      });
      await Future.delayed(const Duration(seconds: 1));
    }
    if (activIndex != -1) {
      dic[quizIndex] = activIndex;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return RezaltScreen(dic: dic, subjectModul: subjectModul);
        },
      ),
    );
  }
}
