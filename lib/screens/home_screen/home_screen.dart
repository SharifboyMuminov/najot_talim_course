import 'package:default_project/data/local/local_database/local_databas.dart';
import 'package:default_project/screens/add_screen.dart/add_screen.dart';
import 'package:default_project/screens/widget/top_button.dart';
import 'package:default_project/screens/home_screen/widgets/empty_show.dart';
import 'package:default_project/screens/home_screen/widgets/item_note.dart';
import 'package:default_project/screens/home_screen/widgets/text_fild.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/local/local_list/local.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showSearche = false;
  String changeTextFild = "";

  @override
  void initState() {
    _getAllData();
    super.initState();
  }

  _getAllData() async {
    personDebtes = await LocalDatabase.getAllDebtors();
    setState(() {});
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
            !showSearche ? 50.getH() : const SizedBox(),
            if (!showSearche)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.we),
                child: Row(
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
              ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.we),
                child: Column(
                  children: [
                    showSearche ? 88.getH() : const SizedBox(),
                    if (showSearche)
                      SearcheTextFild(
                        onChge: (String value) {},
                        onTabXmark: () {},
                      ),
                    15.getH(),
                    if (personDebtes.isNotEmpty)
                      ...List.generate(
                        personDebtes.length,
                        (index) {
                          return ItemNoteButton(
                            isActivRemove: personDebtes[index].isRemove,
                            onTab: () async {
                              if (personDebtes[index].isRemove &&
                                  personDebtes[index].id != null) {
                                await LocalDatabase.deleteDebtors(
                                    personDebtes[index].id!);
                                _getAllData();
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return AddScreen(
                                        onSchange: () {
                                          _getAllData();
                                        },
                                        isInfo: true,
                                        personModul: personDebtes[index],
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                            onLongPress: () {
                              setState(
                                () {
                                  personDebtes[index].isRemove =
                                      !personDebtes[index].isRemove;
                                },
                              );
                            },
                            item: personDebtes[index],
                          );
                        },
                      ),
                    if (personDebtes.isEmpty) 182.getH(),
                    if (personDebtes.isEmpty)
                      ShowEmptyImage(
                        isSearhe: showSearche,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: SizedBox(
          height: 70.we,
          width: 70.we,
          child: FloatingActionButton(
              backgroundColor: AppColors.c_3B3B3B,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AddScreen(onSchange: () {
                        _getAllData();
                      });
                    },
                  ),
                );
              },
              child: Icon(
                Icons.add,
                size: 35.we,
              )),
        ),
      ),
    );
  }
}
