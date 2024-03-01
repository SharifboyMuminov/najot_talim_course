import 'dart:async';

import 'package:default_project/data/local/local_data/local_database.dart';
import 'package:default_project/data/local/local_objescs.dart';
import 'package:default_project/data/models/task/task_modul.dart';
import 'package:default_project/screens/index/add/add_screen.dart';
import 'package:default_project/screens/index/home/home_screen.dart';
import 'package:default_project/screens/index/home/widget/bttom_item.dart';
import 'package:default_project/screens/index/widgets/text_filda_add.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import 'dialogs/categoriy_dialog.dart';
import 'dialogs/priority.dart';

class BottomNavigationCostym extends StatefulWidget {
  const BottomNavigationCostym({super.key});

  @override
  State<BottomNavigationCostym> createState() => _BottomNavigationCostymState();
}

bool isShowBottomDialog = false;

class _BottomNavigationCostymState extends State<BottomNavigationCostym> {
  StreamController streamController = StreamController<bool>();
  List<Widget> _screens = [
    HomeScreen(
      onSet: (v) {},
    ),
    AddScreen(),
  ];
  int activIndex = 0;
  int activPriopt = 1;
  TextEditingController controllerAdd = TextEditingController();
  TextEditingController controllerDecreption = TextEditingController();
  bool isSetTask = false;
  DateTime? dateTime;
  TimeOfDay? timeOfDay;
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();

  TaskModul taskModul = TaskModul.initialValue();
  TaskModul? setTaskModul;

  @override
  void initState() {
    _init();
    _initCange();
    super.initState();
  }

  _initCange() async {
    categiries = await LocalDatabase.getAllCategory();
    setState(() {});
  }

  _init() async {
    _screens = [
      HomeScreen(
        stream: streamController.stream.asBroadcastStream(),
        onSet: (v) {
          setTaskModul = v;
          print(setTaskModul!.getInfo());
          setState(() {});
        },
      ),
      AddScreen(),
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: activIndex,
            children: _screens,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.only(
                  bottom: 30.he, top: 4.he, left: 25.we, right: 25.we),
              color: AppColors.c_353535,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomItem(
                    onTab: () {
                      activIndex = 0;
                      setState(() {});
                    },
                    title: 'Index',
                    icon: AppImages.index,
                  ),
                  BottomItem(
                    onTab: () {
                      activIndex = 1;
                      setState(() {});
                    },
                    title: "Profile",
                    icon: AppImages.profile,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 50.he),
              height: 65.we,
              width: 65.we,
              child: FloatingActionButton(
                backgroundColor: AppColors.c_8687E7,
                onPressed: () {
                  isShowBottomDialog = !isShowBottomDialog;
                  setState(() {});
                },
                child: SvgPicture.asset(
                  AppImages.plus,
                ),
              ),
            ),
          ),
          if (isShowBottomDialog)
            InkWell(
              onTap: () {
                isShowBottomDialog = !isShowBottomDialog;
                setState(() {});
              },
              child: Container(
                width: width,
                height: height,
                color: Colors.black45,
              ),
            ),
          if (isShowBottomDialog)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(horizontal: 24.we),
                width: width,
                height: 260,
                decoration: BoxDecoration(
                  color: AppColors.c_363636,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 15.he),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add Task",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: AppColors.c_FFFFFF.withOpacity(0.87),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      14.getH(),
                      AddtextFild(
                        controller: controllerAdd,
                        hintText: 'Title',
                        textInputAction: TextInputAction.next,
                        focusNode: focusNode1,
                      ),
                      10.getH(),
                      AddtextFild(
                        controller: controllerDecreption,
                        hintText: "Description",
                        textInputAction: TextInputAction.done,
                        focusNode: focusNode2,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              focusNode1.unfocus();
                              focusNode2.unfocus();
                              dateTime = await showDatePicker(
                                cancelText: "Cancel",
                                confirmText: "Select",
                                barrierDismissible: false,
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030),
                                currentDate: DateTime.now(),
                              );
                              timeOfDay = await showTimePicker(
                                context: context,
                                initialEntryMode: TimePickerEntryMode.input,
                                initialTime:
                                    const TimeOfDay(hour: 8, minute: 0),
                                builder: (BuildContext context, Widget? child) {
                                  return MediaQuery(
                                    data: MediaQuery.of(context)
                                        .copyWith(alwaysUse24HourFormat: true),
                                    child: child!,
                                  );
                                },
                              );
                              if (dateTime != null && timeOfDay != null) {
                                var day = dateTime.toString().split(" ")[0];
                                var hour = timeOfDay!.hour.toString();
                                var minut = timeOfDay!.minute.toString();

                                hour = hour.length == 1 ? "0$hour" : hour;
                                minut = minut.length == 1 ? "0$minut" : minut;

                                taskModul = taskModul.copyWith(
                                    hour: "$hour:$minut", days: day);
                              }
                            },
                            icon: SvgPicture.asset(
                              AppImages.time,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              focusNode1.unfocus();
                              focusNode2.unfocus();
                              gitCategoriyDialog(
                                  context: context,
                                  onChange: (int value) {
                                    taskModul = taskModul.copyWith(
                                        categoriModul: categiries[value]);
                                  },
                                  categoriModul: taskModul.categoriModul);
                            },
                            icon: SvgPicture.asset(
                              AppImages.categoriy,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              focusNode1.unfocus();
                              focusNode2.unfocus();
                              getPriorityDialog(
                                  context: context,
                                  onChange: (int value) {
                                    taskModul =
                                        taskModul.copyWith(priority: value);
                                  },
                                  i: taskModul.priority);
                            },
                            icon: SvgPicture.asset(
                              AppImages.priorty,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () async {
                              if (controllerAdd.text.isNotEmpty &&
                                  controllerDecreption.text.isNotEmpty) {
                                taskModul = taskModul.copyWith(
                                    title: controllerAdd.text,
                                    description: controllerDecreption.text);
                                if (taskModul.canAddTaskToDatabase()) {
                                  await LocalDatabase.insertTask(taskModul);
                                  streamController.add(true);
                                  controllerAdd.clear();
                                  controllerDecreption.clear();
                                  tasks.add(taskModul);
                                  isShowBottomDialog = false;
                                  taskModul = TaskModul.initialValue();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.black38,
                                      content: const Text('Success :)'),
                                    ),
                                  );
                                  setState(() {});
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      content: const Text('Error!'),
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: const Text('Error!'),
                                  ),
                                );
                              }
                            },
                            icon: SvgPicture.asset(
                              AppImages.save,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
