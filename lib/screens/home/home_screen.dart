import 'package:default_project/data/local/local_varibalse.dart';
import 'package:default_project/data/models/book/book_model.dart';
import 'package:default_project/screens/add/add_screen.dart';
import 'package:default_project/screens/info/info_screen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/utils/text_style.dart';
import 'package:default_project/views/book_view_model/book_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'widget/book_name.dart';
import 'widget/categoriy_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int acrivIndex = 0;
  int col = 0;
  @override
  void initState() {
    col = int.parse("0xFFFCC400");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.c_FFFFFF,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            elevation: 0.5,
            pinned: true,
            backgroundColor: AppColors.c_FFFFFF,
            centerTitle: false,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Book",
                  style: AppTextStyle.robotoMedium.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.c_000000,
                  ),
                ),
                Text(
                  " Junction",
                  style: AppTextStyle.robotoMedium.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.c_D1618A,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AddScreen();
                      },
                    ),
                  );
                },
                icon: Icon(
                  Icons.add,
                  size: 18.sp,
                  color: AppColors.c_000000,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/budilnik.svg"),
              ),
              SizedBox(width: 10.we),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "Har qanday zamonda yagona najod Ilm.   Imom Buxoriy",
                      style: AppTextStyle.robotoMedium.copyWith(
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: CategoriyItem(
              activIndex: acrivIndex,
              onChangeIndex: (int value) {
                acrivIndex = value;
                activCategoriyIndex = value;
                context.read<BookViewModel>().activCategory();
                setState(() {});
              },
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 20.he),
            sliver: SliverGrid.builder(
              itemCount: context.watch<BookViewModel>().activList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 15,
                childAspectRatio: 0.7,
              ),
              itemBuilder: ((context, index) {
                BookModel bookModel =
                    context.watch<BookViewModel>().activList[index];
                return InkWell(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog.adaptive(
                          title: Text(
                            "Do you want to delete the reference?",
                            style: AppTextStyle.robotoMedium.copyWith(
                              color: AppColors.c_000000,
                              fontSize: 17.sp,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Canel",
                                style: AppTextStyle.robotoRegular.copyWith(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<BookViewModel>()
                                    .deletBook(bookModel: bookModel);
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Ok",
                                style: AppTextStyle.robotoRegular.copyWith(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return InfoScreen(indexBook: index);
                        },
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.c_FFFFFF,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.c_939393.withOpacity(0.2),
                          blurRadius: 30,
                          spreadRadius: 6,
                          offset: const Offset(0, 20),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 35.we, vertical: 13.he),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.r),
                                topRight: Radius.circular(12.r),
                              ),
                              color: Color(int.parse("0xFF${bookModel.color}")),
                            ),
                            child: Hero(
                              tag: bookModel.imageUrl,
                              child: Image.network(
                                bookModel.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.we),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BookNameAndRate(bookModel: bookModel),
                              3.getH(),
                              Text(
                                bookModel.mualif,
                                style: AppTextStyle.robotoRegular.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.c_515151,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "90000 sum",
                                    style:
                                        AppTextStyle.robotoThinItalic.copyWith(
                                      color: AppColors.c_000000,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.we, vertical: 3.we),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.c_000000,
                                          width: 0.5,
                                        )),
                                    child: SvgPicture.asset(
                                      "assets/icons/arrow_right.svg",
                                      width: 22.we,
                                      height: 22.he,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        5.getH(),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
