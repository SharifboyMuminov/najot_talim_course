import 'package:default_project/moduls/burning.dart';
import 'package:default_project/moduls/data_repo.dart';
import 'package:default_project/moduls/persons.dart';
import 'package:default_project/screens/global_widget.dart/top_button.dart';
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
  late List<Person> ls1;
  late List<Person> ls2;

  bool showSearche = false;
  String changeTextFild = "";

  @override
  void initState() {
    ls1 = DataRepository.instanse.allSubject[0].people;
    ls2 = DataRepository.instanse.allSubject[0].people;

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
                        ls1 = ls1
                            .where(
                              (element) => element.fullname.toLowerCase().contains(
                                    value.toLowerCase(),
                                  ),
                            )
                            .toList();
                        if (value.isEmpty) {
                          ls1 = ls2;
                        }
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
              if (ls1.isNotEmpty)
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 10.we),
                    child: Column(
                      children: [
                        ...List.generate(
                          ls1.length,
                          (index) {
                            return ItemNoteButton(
                              isActivRemove: ls1[index].isRemove,
                              onTab: () {
                                if (ls1[index].isRemove) {
                                  setState(
                                    () {
                                      ls1.remove(ls1[index]);
                                    },
                                  );
                                }
                              },
                              onLongPress: () {
                                setState(
                                  () {
                                    ls1[index].isRemove = !ls1[index].isRemove;
                                  },
                                );
                              },
                              item: ls1[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              if (ls1.isEmpty) 182.getH(),
              if (ls1.isEmpty)
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
