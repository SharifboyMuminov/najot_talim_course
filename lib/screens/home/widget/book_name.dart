import 'package:default_project/data/models/book/book_model.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/text_style.dart';

class BookNameAndRate extends StatelessWidget {
  const BookNameAndRate({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 30.we,
          child: Text(
            bookModel.name,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: AppTextStyle.robotoMedium.copyWith(
              color: AppColors.c_000000,
              fontSize: 12.sp,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4.we, vertical: 2.he),
          decoration: BoxDecoration(
            color: AppColors.c_FFF8E0,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: AppColors.c_FCC400,
                size: 15.sp,
              ),
              Text(
                bookModel.rate.toString(),
                style: AppTextStyle.robotoRegular.copyWith(
                  fontSize: 10.sp,
                  color: AppColors.c_000000,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
