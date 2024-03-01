import 'package:default_project/data/local/local_objescs.dart';
import 'package:default_project/data/models/task/task_modul.dart';
import 'package:default_project/screens/index/bottom_navi.dart';
import 'package:default_project/screens/routes.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/local/local_data/local_database.dart';
import 'widget/emptu_show.dart';
import 'widget/task_item.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.onSet,
    this.stream,
  });
  final ValueChanged<TaskModul>? onSet;
  final Stream? stream;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _initSet();
    if (widget.stream != null) {
      widget.stream!.listen((event) {
        _initSet();
      });
    }

    super.initState();
  }

  _initSet() async {
    tasks = await LocalDatabase.getAllTasks();
    setState(() {});
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
                              onTab: () async {
                                if (tasks[index].isDelet) {
                                  if (tasks[index].id != null) {
                                    await LocalDatabase.deleteTask(
                                        tasks[index].id!);
                                    tasks.remove(tasks[index]);
                                  }
                                } else {
                                  Navigator.pushNamed(
                                    context,
                                    RoutName.infoScreen,
                                    arguments: tasks[index],
                                  );
                                }
                                setState(() {});
                              },
                              onChange: (bool? value) {
                                if (value != null) {
                                  tasks[index].isChek = !tasks[index].isChek;
                                  setState(() {});
                                }
                              },
                              onLongPrees: () {
                                tasks[index].isDelet = !tasks[index].isDelet;
                                setState(() {});
                              },
                              onTabSet: () {
                                if (widget.onSet != null) {
                                  isShowBottomDialog = true;
                                  widget.onSet!.call(tasks[index]);
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
