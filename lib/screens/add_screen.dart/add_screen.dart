import 'package:default_project/moduls/persons.dart';
import 'package:default_project/screens/global_widget.dart/top_button.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/show_dialog.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({
    super.key,
    required this.ls1,
    required this.onSchange,
  });
  final List<Person> ls1;
  final Function onSchange;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  late List<Person> ls1;

  bool isSvae = true;
  bool isPop = false;

  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerSubTitle = TextEditingController();

  @override
  void initState() {
    ls1 = widget.ls1;
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
        backgroundColor: AppColors.c_252525,
        body: Column(
          children: [
            53.getH(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.we),
              child: Row(
                children: [
                  ButtonTop(
                    icon: AppImages.arrowBack,
                    onTab: () {
                      if (controllerTitle.text.isEmpty) {
                        Navigator.pop(context);
                      }

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertView(
                            onTabSave: () {
                              ls1.add(
                                Person(
                                    fullname: controllerTitle.text,
                                    text: controllerSubTitle.text,
                                    isRemove: false),
                              );
                              widget.onSchange.call();
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            onTabDiscard: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    },
                  ),
                  const Spacer(),
                  ButtonTop(
                    icon: AppImages.look,
                    onTab: () {},
                  ),
                  21.getW(),
                  ButtonTop(
                    icon: AppImages.save,
                    onTab: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertView(
                            onTabSave: () {
                              if (controllerTitle.text.isNotEmpty &&
                                  controllerSubTitle.text.isNotEmpty) {
                                ls1.add(
                                  Person(
                                      fullname: controllerTitle.text,
                                      text: controllerSubTitle.text,
                                      isRemove: false),
                                );
                                isSvae = false;
                                isPop = true;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Save ^_^"),
                                  ),
                                );
                                widget.onSchange.call();
                                Navigator.pop(context);
                                Navigator.pop(context);

                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 2),
                                    content: Text("Error empty text :("),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                Navigator.pop(context);
                              }
                            },
                            onTabDiscard: () {
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.we, vertical: 30.he),
                child: Column(
                  children: [
                    TextField(
                      // ignorePointers: false,
                      controller: controllerTitle,
                      maxLength: null,
                      maxLines: null,
                      onChanged: (v) {},
                      cursorColor: AppColors.c_CCCCCC,
                      style: TextStyle(
                        color: AppColors.c_FFFFFF,
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                          hintText: "Title",
                          hintStyle: TextStyle(
                            color: AppColors.c_9A9A9A,
                            fontSize: 45.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide:
                                  BorderSide(color: AppColors.c_252525)),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide:
                                  BorderSide(color: AppColors.c_252525))),
                    ),
                    TextField(
                      controller: controllerSubTitle,
                      maxLength: null,
                      maxLines: null,
                      onChanged: (v) {},
                      cursorColor: AppColors.c_CCCCCC,
                      style: TextStyle(
                        color: AppColors.c_FFFFFF,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                          hintText: "Type something...",
                          hintStyle: TextStyle(
                            color: AppColors.c_9A9A9A,
                            fontSize: 23.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide:
                                  BorderSide(color: AppColors.c_252525)),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide:
                                  BorderSide(color: AppColors.c_252525))),
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
}
