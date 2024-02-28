import 'package:default_project/data/local/local_objescs.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'widget/emptu_show.dart';
import 'widget/task_item.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.c_121212,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Index",
            style: TextStyle(
              color: AppColors.c_FFFFFF.withOpacity(0.87),
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          elevation: 0,
          backgroundColor: AppColors.c_121212,
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppImages.menu,
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            setState(() {});
            return Future<void>.delayed(const Duration(seconds: 2));
          },
          child: ListView(
            children: [
              tasks.isEmpty
                  ? EmptyShow()
                  : Column(
                      children: [
                        ...List.generate(
                          tasks.length,
                          (index) {
                            return TaskItem(
                              taskModul: tasks[index],
                              onTab: () {
                                tasks[index].isChek = !tasks[index].isChek;
                                setState(() {});
                              },
                              onChange: (bool? value) {
                                if (value != null) {
                                  tasks[index].isChek = !tasks[index].isChek;
                                  setState(() {});
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
