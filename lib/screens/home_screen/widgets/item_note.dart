import 'package:default_project/data/models/notes/note.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ItemNoteButton extends StatelessWidget {
  const ItemNoteButton({
    super.key,
    required this.isActiveRemove,
    required this.onTab,
    required this.onLongPress,
    required this.item, required this.backgroundColor,
  });

  final NoteModel item;
  final bool isActiveRemove;
  final VoidCallback onTab;
  final VoidCallback onLongPress;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 13.he),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isActiveRemove ? Colors.red : backgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextButton(

        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 30.we, vertical: 27.he),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onLongPress: onLongPress,
        onPressed: onTab,
        child: isActiveRemove
            ? SvgPicture.asset(AppImages.remove)
            : Text(
                item.fullName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                ),
              ),
      ),
    );
  }
}
