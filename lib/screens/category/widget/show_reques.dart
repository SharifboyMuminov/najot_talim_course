import 'package:default_project/data/model/category/category_model.dart';
import 'package:default_project/view/categoriy_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void showRequest(BuildContext context,{required CategoryModel categoryModel}){
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        title: Text(
          "Do you want to delete the reference?",
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Canel",
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
          TextButton(
            onPressed: () {
              context.read<CategoryViewModel>().deleteCategory(context,
                  docId: categoryModel.docId);
              Navigator.pop(context);
            },
            child: Text(
              "Yes",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.red,
              ),
            ),
          ),
        ],
      );
    },
  );
}