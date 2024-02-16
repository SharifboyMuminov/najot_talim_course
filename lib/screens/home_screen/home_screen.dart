import 'package:default_project/moduls/subjec_modul.dart';
import 'package:default_project/screens/widgets/global_appbar.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/size.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.data});
  final SubjectModul data;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.c_273032,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.c_273032,
      ),
      child: Scaffold(
        backgroundColor: AppColors.c_273032,
        body: Column(
          children: [
            SizedBox(height: 50.he),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.we),
              child: GlobalAppBar(
                title: "Start Quiz",
                onTabArrow: () {},
              ),
            ),
            SizedBox(height: 22.he),
            Expanded(
              child: Container(
                width: width,
                height: double.infinity,
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
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(
                            left: 32.we, right: 32.we, top: 32.he),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Put your understanding of this concept to test by answering a few MCQs.",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.c_F2F2F2,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 15.he),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                    color: AppColors.c_F2954D, width: 1.5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: Image.asset(
                                      AppImages.iamge1,
                                      width: 326.we,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.we),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10.he),
                                        _getRichText(
                                            text1: "Subject:  ",
                                            text2: data.name),
                                        SizedBox(height: 7.he),
                                        _getRichText(
                                            text1: "Chapter: ",
                                            text2: data.questions.length
                                                .toString()),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 9.he),
                                ],
                              ),
                            ),
                            SizedBox(height: 25.he),
                            _getRichText(
                                text1: "Total Questions:  ",
                                text2: data.questions.length.toString()),
                            SizedBox(height: 12.he),
                            _getRichText(
                                text1: "Total Time: ",
                                text2: (data.questions.length * 3).toString()),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 36.we, vertical: 20.he),
                      decoration: BoxDecoration(
                        color: AppColors.c_273032,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.r),
                            topRight: Radius.circular(40.r)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.we, vertical: 12.he),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                side: BorderSide(
                                    color: AppColors.c_F2F2F2, width: 1),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppImages.budilnik),
                                  Text(
                                    " ${data.questions.length * 3}:00",
                                    style: TextStyle(
                                      color: AppColors.c_F2F2F2,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 32.we),
                          Expanded(
                            flex: 4,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 12.he),
                                backgroundColor: AppColors.c_F2954D,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => QuizStart(
                                              data: data,
                                            )));
                              },
                              child: Text(
                                "Start Quiz",
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getRichText({required text1, required text2}) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: TextStyle(
          color: AppColors.c_F2F2F2,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: text2,
            style: TextStyle(
              color: AppColors.c_F2F2F2,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class QuizStart extends StatefulWidget {
  const QuizStart({super.key, required this.data});
  final SubjectModul data;

  @override
  State<QuizStart> createState() => _QuizStartState();
}

class _QuizStartState extends State<QuizStart> {
  late SubjectModul data;

  @override
  void initState() {
    data = widget.data;
    super.initState();
  }

  int activIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(data.questions[activIndex].question_test),
          SizedBox(height: 50.he),
          ...List.generate(
            data.questions[activIndex].variants.length,
            (index) => Text(
              data.questions[activIndex].variants[index],
            ),
          ),
          SizedBox(height: 40.he),
          SizedBox(width: double.infinity),
          TextButton(
            onPressed: () {
              if (data.questions.length - 1 > activIndex) {
                activIndex++;
              }
              setState(() {});
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
