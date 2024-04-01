import 'package:default_project/data/local/local_database/local_databas.dart';
import 'package:default_project/screens/add_screen.dart/add_screen.dart';
import 'package:default_project/screens/widget/top_button.dart';
import 'package:default_project/screens/home_screen/widgets/empty_show.dart';
import 'package:default_project/screens/home_screen/widgets/item_note.dart';
import 'package:default_project/screens/home_screen/widgets/text_fild.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view_models/connect_sql.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
            !showSearche ? 50.getH() : const SizedBox(),
            if (!showSearche)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.we),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Notes",
                      style: TextStyle(
                        color: AppColors.c_FFFFFF,
                        fontSize: 43.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ButtonTop(
                        icon: AppImages.searcheSvg,
                        onTab: () {
                          setState(() {
                            showSearche = true;
                          });
                        }),
                  ],
                ),
              ),
            showSearche ? 65.getH() : const SizedBox(),
            if (showSearche)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.we),
                child: SearcheTextFild(
                  onChge: context.read<ConnectSql>().searchNotes,
                  onTabXmark: () {
                    showSearche = false;
                    context.read<ConnectSql>().getAllNote();
                  },
                ),
              ),
            15.getH(),
            if (context.watch<ConnectSql>().notes.isNotEmpty)
              Expanded(
                child: Consumer<ConnectSql>(
                  builder: (BuildContext context, ConnectSql sqlView,
                      Widget? child) {
                    if (sqlView.loading) {
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    }
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 24.we),
                      itemCount: sqlView.notes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemNoteButton(
                          isActivRemove: sqlView.notes[index].isRemove,
                          onTab: () async {
                            if (sqlView.notes[index].isRemove &&
                                sqlView.notes[index].id != null) {
                              context
                                  .read<ConnectSql>()
                                  .deleteNote(noteModel: sqlView.notes[index]);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AddScreen(
                                      isInfo: true,
                                      personModul: sqlView.notes[index],
                                    );
                                  },
                                ),
                              );
                            }
                          },
                          onLongPress: () {
                            setState(
                              () {
                                sqlView.notes[index].isRemove =
                                    !sqlView.notes[index].isRemove;
                              },
                            );
                          },
                          item: sqlView.notes[index],
                        );
                      },
                    );
                  },
                ),
              ),
            if (context.watch<ConnectSql>().notes.isEmpty) 182.getH(),
            if (context.watch<ConnectSql>().notes.isEmpty)
              ShowEmptyImage(
                isSearhe: showSearche,
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
                      return AddScreen();
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
