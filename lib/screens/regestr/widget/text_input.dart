import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputMyWidget extends StatelessWidget {
  const TextInputMyWidget(
      {super.key, required this.hitText, required this.textEditingController});

  final String hitText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.we,vertical: 15.he),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.black, width: 2.we),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.black, width: 1.we),
          ),
          hintText: hitText,
        ),
      ),
    );
  }
}
