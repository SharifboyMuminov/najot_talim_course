import 'package:default_project/data/moduls/note.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ItemNoteButton extends StatelessWidget {
  const ItemNoteButton({
    super.key,
    required this.isActivRemove,
    required this.onTab,
    required this.onLongPress,
    required this.item,
  });

  final NoteModel item;
  final bool isActivRemove;
  final VoidCallback onTab;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 13.he),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isActivRemove ? Colors.red : Colors.white10,
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
        child: isActivRemove
            ? SvgPicture.asset(AppImages.remove)
            : Text(
                item.fullname,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                ),
              ),
      ),
    );
  }
}
