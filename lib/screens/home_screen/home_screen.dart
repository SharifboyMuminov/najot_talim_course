import 'package:default_project/blocs/notes/notes_bloc.dart';
import 'package:default_project/blocs/notes/notes_event.dart';
import 'package:default_project/blocs/notes/notes_state.dart';
import 'package:default_project/screens/add_screen.dart/add_screen.dart';
import 'package:default_project/screens/widget/top_button.dart';
import 'package:default_project/screens/home_screen/widgets/empty_show.dart';
import 'package:default_project/screens/home_screen/widgets/item_note.dart';
import 'package:default_project/screens/home_screen/widgets/text_fild.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showSearche = false;

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
                        setState(
                          () {
                            showSearche = true;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            showSearche ? 65.getH() : const SizedBox(),
            if (showSearche)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.we),
                child: SearcheTextFild(
                  onChge: (v) {
                    context.read<NotesBloc>().add(NotesSearchEvent(title: v));
                  },
                  onTabXmark: () {
                    showSearche = false;
                    setState(() {});
                  },
                ),
              ),
            15.getH(),
            BlocBuilder<NotesBloc, NotesState>(
              buildWhen: (previous, current) {
                return previous != current;
              },
              builder: (BuildContext context, NotesState state) {
                if (state is LoadingState) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }

                if (state is SuccessState) {
                  if (state.notesData.isEmpty) {
                    return Column(
                      children: [
                        182.getH(),
                        ShowEmptyImage(
                          isSearhe: showSearche,
                        ),
                      ],
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 24.we),
                        itemCount: state.notesData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemNoteButton(
                            isActiveRemove: state.notesData[index].isRemove,
                            onTab: () async {
                              if (state.notesData[index].isRemove &&
                                  state.notesData[index].id != null) {
                                context.read<NotesBloc>().add(NotesDeleteEvent(
                                    noteModel: state.notesData[index]));

                                showSearche = false;
                                setState(() {});
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return AddScreen(
                                        isInfo: true,
                                        personModul: state.notesData[index],
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                            onLongPress: () {
                              setState(
                                () {
                                  state.notesData[index].isRemove =
                                      !state.notesData[index].isRemove;
                                },
                              );
                            },
                            item: state.notesData[index],
                            backgroundColor: state.notesData[index].color,
                          );
                        },
                      ),
                    );
                  }
                }
                return const SizedBox();
              },
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
            ),
          ),
        ),
      ),
    );
  }
}
