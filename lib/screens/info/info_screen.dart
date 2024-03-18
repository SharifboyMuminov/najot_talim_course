import 'package:default_project/screens/edit/edit_screen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/utils/text_style.dart';
import 'package:default_project/views/book_view_model/book_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'widget/arrow_button.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, required this.indexBook});
  final int indexBook;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  int index = 0;

  @override
  void initState() {
    index = widget.indexBook;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            context.watch<BookViewModel>().activList[index].imageUrl,
            fit: BoxFit.cover,
            width: width,
            height: height,
          ),
          Container(
            width: width,
            height: height,
            color: AppColors.c_FFFFFF.withOpacity(0.8),
          ),
          ArrowButton(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.we),
              width: width,
              height: height / 2.3,
              color: AppColors.c_FFFFFF,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  45.getH(),
                  Text(
                    "Descreption:",
                    style: AppTextStyle.robotoBold.copyWith(
                      color: AppColors.c_000000,
                      fontSize: 20.sp,
                    ),
                  ),
                  10.getH(),
                  Text(
                    context.watch<BookViewModel>().books[index].description,
                    style: AppTextStyle.robotoRegular.copyWith(
                      color: AppColors.c_000000,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                65.getH(),
                Text(
                  context.watch<BookViewModel>().activList[index].name,
                  style: AppTextStyle.robotoBold.copyWith(
                    fontSize: 24.sp,
                    color: AppColors.c_000000,
                  ),
                ),
                Text(
                  context.watch<BookViewModel>().activList[index].mualif,
                  style: AppTextStyle.robotoMedium.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.c_939393,
                  ),
                ),
                20.getH(),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          blurRadius: 30,
                          spreadRadius: 5,
                          offset: const Offset(0, 40)),
                    ],
                  ),
                  child: Hero(
                    tag: context.watch<BookViewModel>().activList[index].imageUrl,
                    child: Image.network(
                      context.watch<BookViewModel>().activList[index].imageUrl,
                      fit: BoxFit.cover,
                      width: 180.we,
                      height: 280.he,
                    ),
                  ),
                ),
                20.getH(),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 13.he, horizontal: 20.we),
                  margin: EdgeInsets.symmetric(horizontal: 30.we),
                  decoration: BoxDecoration(
                    color: AppColors.c_FFFFFF,
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 30,
                        spreadRadius: 7,
                        offset: Offset(0, 25),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.we, vertical: 2.he),
                        decoration: BoxDecoration(
                          color: AppColors.c_FFF8E0,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColors.c_FCC400,
                              size: 18.sp,
                            ),
                            Text(
                              context
                                  .watch<BookViewModel>()
                                  .activList[index]
                                  .rate
                                  .toString(),
                              style: AppTextStyle.robotoBold.copyWith(
                                fontSize: 14.sp,
                                color: AppColors.c_000000,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.we, vertical: 5.he),
                        decoration: BoxDecoration(
                          color: AppColors.c_404066,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          "Badiy",
                          style: AppTextStyle.robotoMedium.copyWith(
                            color: AppColors.c_FFFFFF,
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "432",
                          style: AppTextStyle.robotoMedium.copyWith(
                            color: AppColors.c_000000,
                            fontSize: 14.sp,
                          ),
                          children: [
                            TextSpan(
                              text: "  Pages",
                              style: AppTextStyle.robotoRegular.copyWith(
                                color: AppColors.c_000000,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: 55,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return EditScreen(
                        bookModel: context.watch<BookViewModel>().activList[index],
                      );
                    },
                  ),
                );
              },
              icon: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.c_000000,
                    width: 0.5,
                  ),
                ),
                child: Icon(
                  Icons.edit,
                  size: 16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
