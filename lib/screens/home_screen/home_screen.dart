import 'package:default_project/screens/home_screen/widgets/button_top.dart';
import 'package:default_project/screens/home_screen/widgets/empty_show.dart';
import 'package:default_project/screens/home_screen/widgets/item_note.dart';
import 'package:default_project/screens/home_screen/widgets/text_fild.dart';
import 'package:default_project/screens/repo.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Model> ls = dataBase;

  bool showSearche = false;
  String changeTextFild = "";

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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.we),
          child: Column(
            children: [
              showSearche ? 88.getH() : 55.getH(),
              if (showSearche)
                SearcheTextFild(
                  onChge: (String value) {
                    setState(
                      () {
                        ls = dataBase
                            .where(
                              (element) => element.name.toLowerCase().contains(
                                    value.toLowerCase(),
                                  ),
                            )
                            .toList();
                      },
                    );
                  },
                  onTabXmark: () {
                    setState(() {
                      showSearche = false;
                    });
                  },
                ),
              if (!showSearche)
                Row(
                  children: [
                    Text(
                      "Notes",
                      style: TextStyle(
                        color: AppColors.c_FFFFFF,
                        fontSize: 43.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    ButtonTop(
                        icon: AppImages.searcheSvg,
                        onTab: () {
                          setState(() {
                            showSearche = true;
                          });
                        }),
                    21.getW(),
                    ButtonTop(icon: AppImages.undovSvg, onTab: () {}),
                  ],
                ),
              15.getH(),
              if (ls.isNotEmpty)
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 10.we),
                    child: Column(
                      children: [
                        ...List.generate(
                          ls.length,
                          (index) {
                            return ItemNoteButton(
                              isActivRemove: ls[index].isRemove,
                              onTab: () {
                                if (ls[index].isRemove) {
                                  setState(
                                    () {
                                      ls.remove(ls[index]);
                                    },
                                  );
                                }
                              },
                              onLongPress: () {
                                setState(
                                  () {
                                    ls[index].isRemove = !ls[index].isRemove;
                                  },
                                );
                              },
                              item: ls[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              if (ls.isEmpty) 182.getH(),
              if (ls.isEmpty)
                ShowEmptyImage(
                  isSearhe: showSearche,
                ),
            ],
          ),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.we, vertical: 15.we),
          decoration: const BoxDecoration(
            color: AppColors.c_252525,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.plus),
          ),
        ),
      ),
    );
  }
}
