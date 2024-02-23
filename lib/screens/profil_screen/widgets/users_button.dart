import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/moduls/contact_model.dart';
import '../../../utils/app_colors.dart';

class UsersButton extends StatelessWidget {
  const UsersButton(
      {super.key, required this.contacModul, required this.onTab});
  final ContacModul contacModul;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Column(
        children: [
          Container(
            width: 58.we,
            height: 58.we,
            margin: EdgeInsets.symmetric(horizontal: 8.we),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(contacModul.imge),
              ),
            ),
          ),
          10.getH(),
          Text(
            contacModul.name,
            style: TextStyle(
              color: AppColors.c_F9F9F9,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
