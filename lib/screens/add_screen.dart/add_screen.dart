import 'package:default_project/data/moduls/note.dart';
import 'package:default_project/screens/widget/top_button.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view_models/connect_sql.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'widget/my_snacbar.dart';
import 'widget/show_dialog.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({
    super.key,
    this.personModul,
    this.isInfo = false,
  });

  final bool isInfo;
  final NoteModel? personModul;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  NoteModel noteModul = NoteModel.defoultModul();

  bool isSvae = true;
  bool isPop = false;
  bool isChane = false;

  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerSubTitle = TextEditingController();

  @override
  void initState() {
    if (widget.personModul != null) {
      noteModul = widget.personModul!;
      controllerTitle.text = noteModul.fullname;
      controllerSubTitle.text = noteModul.text;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    onTab: _testMetodArrow,
                  ),
                  const Spacer(),
                  ButtonTop(
                    icon: AppImages.save,
                    onTab: () {
                      if (widget.personModul != null) {
                        _myShowDialog(
                          onTabSave: () {
                            String title = controllerTitle.text;
                            String subTitle = controllerSubTitle.text;
                            noteModul.copyWith(
                              id: widget.personModul!.id,
                              fullname: title,
                              text: subTitle,
                            );
                            context
                                .read<ConnectSql>()
                                .updateNote(noteModel: noteModul);
                            muySnackBar(context, text: "Malumot ynagilandi :)");
                            Navigator.pop(context);
                            Navigator.pop(context);
                            context.read<ConnectSql>().updateNote(
                                  noteModel: noteModul,
                                );
                          },
                          title: "Do you want to update the information?",
                        );
                      } else {
                        _myShowDialog(onTabSave: () {
                          context
                              .read<ConnectSql>()
                              .insertNote(noteModel: noteModul);
                          muySnackBar(context, text: "Malumot saqlandi :)");
                          Navigator.pop(context);
                          Navigator.pop(context);
                        });
                      }
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
                      textInputAction: TextInputAction.next,
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
                      textInputAction: TextInputAction.done,
                      controller: controllerSubTitle,
                      maxLength: null,
                      maxLines: null,
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

  _myShowDialog(
      {required VoidCallback onTabSave,
      String title = "Do you want to save the information?"}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertView(
          onTabSave: onTabSave,
          onTabDiscard: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          title: title,
        );
      },
    );
  }

  _testMetodArrow() {
    String title = controllerTitle.text;
    String subTitle = controllerSubTitle.text;
    if (title.isNotEmpty && subTitle.isNotEmpty) {
      noteModul = noteModul.copyWith(
        fullname: controllerTitle.text,
        text: controllerSubTitle.text,
        date: DateTime.now().toString(),
      );

      if (widget.personModul != null) {
        if (title == widget.personModul!.fullname &&
            subTitle == widget.personModul!.text) {
          Navigator.pop(context);
        } else {
          _myShowDialog(onTabSave: () {
            noteModul.copyWith(
              id: widget.personModul!.id,
              fullname: title,
              text: subTitle,
            );
            context.read<ConnectSql>().updateNote(noteModel: noteModul);
            muySnackBar(context, text: "Malumot ynagilandi :)");
            Navigator.pop(context);
            Navigator.pop(context);
          });
        }
      } else {
        _myShowDialog(onTabSave: () {
          context.read<ConnectSql>().insertNote(noteModel: noteModul);
          muySnackBar(context);
          Navigator.pop(context);
          Navigator.pop(context);
        });
      }
    } else {
      Navigator.pop(context);
    }
  }
}
