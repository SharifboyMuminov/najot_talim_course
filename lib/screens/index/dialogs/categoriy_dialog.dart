import 'package:default_project/data/local/local_objescs.dart';
import 'package:default_project/data/models/categori/categori_modeul.dart';
import 'package:default_project/screens/index/dialogs/add_categoriy/add_categoriy.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

gitCategoriyDialog(
    {required BuildContext context,
    required ValueChanged<int> onChange,
    required CategoriModul categoriModul}) {
  int activIndex = categiries.indexOf(categoriModul);

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 128.he, horizontal: 24.we),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.r)),
              color: AppColors.c_363636,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 11.he),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 11.we,
                      ),
                      child: Text(
                        "Choose Category",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.c_FFFFFF.withOpacity(0.87),
                        ),
                      ),
                    ),
                    10.getH(),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 11.we,
                      ),
                      width: double.infinity,
                      height: 1,
                      color: AppColors.c_979797,
                    ),
                    10.getH(),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: categiries.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.we, vertical: 16.he),
                                  backgroundColor: categiries[index]
                                      .color
                                      .withOpacity(
                                          activIndex == index ? 1 : 0.6),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.r)),
                                ),
                                onPressed: () {
                                  activIndex = index;
                                  setState(() {});
                                },
                                child: Text(
                                  categiries[index].icon,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                              5.getH(),
                              Text(
                                categiries[index].title,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.c_FFFFFF.withOpacity(
                                      0.87,
                                    )),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: width / 2.8,
                          margin: EdgeInsets.symmetric(horizontal: 19.we),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.c_8687E7,
                              padding: EdgeInsets.symmetric(vertical: 12.he),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            onPressed: () {
                              onChange.call(activIndex);
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Add Category",
                              style: TextStyle(
                                color: AppColors.c_FFFFFF,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width / 2.8,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return AddCategoriy(
                                    onSet: () {
                                      setState(() {});
                                    },
                                  );
                                }),
                              );
                            },
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
