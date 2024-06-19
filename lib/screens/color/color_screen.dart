import 'package:default_project/blocs/notes/notes_bloc.dart';
import 'package:default_project/blocs/notes/notes_event.dart';
import 'package:default_project/data/local/local_list/local.dart';
import 'package:default_project/data/models/notes/note.dart';
import 'package:default_project/screens/home_screen/home_screen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  double sliderValue = 20;
  Color currentColor = myColors.first;
  late NoteModel noteModel;

  @override
  void initState() {
    noteModel = widget.noteModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_252525,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.we),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            80.getH(),
            Text(
              "Choose a color",
              style: TextStyle(
                color: AppColors.c_FFFFFF,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            20.getH(),
            Container(
              width: width,
              height: 100,
              decoration: BoxDecoration(
                color: currentColor.withOpacity(
                  double.parse(
                    "0.${sliderValue.toInt() < 10 ? "0" : ""}${sliderValue.toInt()}",
                  ),
                ),
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
            20.getH(),
            Wrap(
              children: [
                ...List.generate(
                  myColors.length,
                  (index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.we,
                        vertical: 5.he,
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: myColors[index],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        onPressed: () {
                          currentColor = myColors[index];
                          setState(() {});
                        },
                        child: SizedBox(
                          width: 50.we,
                          height: 50.we,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            20.getH(),
            Container(
              width: double.infinity,
              height: 50.he,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                gradient: LinearGradient(
                  colors: List.generate(
                    99,
                    (index) {
                      return currentColor.withOpacity(
                        double.parse(
                          "0.${index < 10 ? "0" : ""}$index",
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            40.getH(),
            Slider.adaptive(
              thumbColor: Colors.white,
              activeColor: currentColor,
              inactiveColor: AppColors.c_FFFFFF,
              value: sliderValue,
              max: 99,
              min: 5,
              onChanged: (v) {
                setState(() {
                  sliderValue = v;
                });
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.we),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15.he),
                    backgroundColor: AppColors.c_3B3B3B,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: _onTabSave,
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: AppColors.c_FFFFFF,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
            ),
            25.getH(),
          ],
        ),
      ),
    );
  }

  _onTabSave() {
    DateTime dateTime = DateTime.now();

    String nowDate = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    noteModel = noteModel.copyWith(
      color: currentColor.withOpacity(
        double.parse(
          "0.${sliderValue.toInt() < 10 ? "0" : ""}${sliderValue.toInt()}",
        ),
      ),
      date: nowDate,
    );
    context.read<NotesBloc>().add(
          NotesInsertEvent(
            noteModel: noteModel,
          ),
        );
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return const HomeScreen();
      },
    ), (route) => false);
  }
}
