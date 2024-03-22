import 'package:default_project/utils/size.dart';
import 'package:default_project/view/authe_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';

class TextFromFieldMyWidget extends StatelessWidget {
  const TextFromFieldMyWidget({
    super.key,
    required this.icon,
    required this.hitText,
    required this.controller,
    this.obscureText = false,
    this.isPassword = false,
    required this.onTab,
    required this.onChange,
  });

  final String icon;
  final String hitText;
  final TextEditingController controller;
  final bool obscureText;
  final bool isPassword;
  final VoidCallback onTab;
  final ValueChanged<String> onChange;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 35.we, vertical: 10.he),
          decoration: BoxDecoration(
            color: AppColors.c_FFFFFF,
            borderRadius: BorderRadius.circular(9.r),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 7,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: TextFormField(
            onChanged: onChange,
            obscureText: obscureText,
            controller: controller,
            style: TextStyle(
              color: AppColors.c_131212,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.we, vertical: 15.he),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  icon,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.r),
                  borderSide: const BorderSide(color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.r),
                  borderSide: const BorderSide(color: Colors.transparent)),
              hintText: hitText,
              hintStyle: TextStyle(
                color: AppColors.c_131212,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: isPassword
                  ? IconButton(
                      onPressed: onTab,
                      icon: SvgPicture.asset(obscureText
                          ? "assets/icons/eye_on.svg"
                          : "assets/icons/eye_off.svg"),
                    )
                  : null,
            ),
          ),
        ),
        if(context.watch<AuthViewModel>().errorBorder) Positioned(
          top: 0,
          left: 40.we,
          child: Text(
            "Error",
            style: TextStyle(color: Colors.red, fontSize: 12.sp),
          ),
        ),
      ],
    );
  }
}
