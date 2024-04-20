import 'package:default_project/blocs/qr_data_bloc/qr_bloc_event.dart';
import 'package:default_project/blocs/qr_data_bloc/qr_data_bloc.dart';
import 'package:default_project/data/models/qr/qr_scanner_model.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showDialogRemove(BuildContext context,
    {required QrScannerModel qrScannerModel}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog.adaptive(
        backgroundColor: AppColors.c_333333,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        title: Text(
          "Do you want to delete the information?",
          style: TextStyle(
            color: AppColors.c_FFFFFF,
            fontWeight: FontWeight.w500,
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
              style: TextStyle(
                color: AppColors.c_FFFFFF,
                fontSize: 16.sp,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              context
                  .read<QrDataBloc>()
                  .add(QrDeleteEvent(qrScannerModel: qrScannerModel));
              Navigator.pop(context);
            },
            child: Text(
              "Ok",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      );
    },
  );
}
