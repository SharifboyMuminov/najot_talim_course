import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';

import 'bottom_button.dart';

class ButtomView extends StatelessWidget {
  const ButtomView({
    super.key,
    required this.onTabNext,
    required this.onTabPrevious,
    required this.showPrevious,
    required this.showNext,
  });
  final VoidCallback onTabNext;
  final VoidCallback onTabPrevious;
  final bool showPrevious;
  final bool showNext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.we),
      child: Row(
        children: [
          if (showPrevious)
            BttomButton(
              colorTitle: AppColors.C_BDBDBD,
              colorBacground: AppColors.c_273032,
              title: "Previous",
              ontTab: onTabPrevious,
            ),
          const Spacer(),
          if (showNext)
            BttomButton(
              colorTitle: AppColors.c_F2F2F2,
              colorBacground: AppColors.c_F2954D,
              title: "Next",
              ontTab: onTabNext,
            ),
        ],
      ),
    );
  }
}
