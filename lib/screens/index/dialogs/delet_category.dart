import 'package:default_project/data/local/local_objescs.dart';
import 'package:default_project/data/models/categori/categori_modeul.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';

import '../../../data/local/local_data/local_database.dart';

deletCategoriy(
    {required BuildContext context,required VoidCallback onSet,required CategoriModul categoriModul}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        backgroundColor: AppColors.c_272727,
        title: const Text(
          "Do you want to delete?",
          style: TextStyle(
            color: AppColors.c_FFFFFF,
          ),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
                padding:
                    EdgeInsets.symmetric(vertical: 12.we, horizontal: 12.he)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Canel",
              style: TextStyle(
                color: AppColors.c_FFFFFF,
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    EdgeInsets.symmetric(vertical: 12.we, horizontal: 12.he)),
            onPressed: () async {
              if (categoriModul.id != null) {
                await LocalDatabase.deleteCategoriy(categoriModul.id!);
                categiries.remove(categoriModul);
                onSet.call();
              }
              Navigator.pop(context);
            },
            child: const Text(
              "Ok",
              style: TextStyle(
                color: AppColors.c_FFFFFF,
              ),
            ),
          ),
        ],
      );
    },
  );
}
