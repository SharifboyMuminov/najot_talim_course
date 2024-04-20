import 'package:default_project/data/models/qr/qr_scanner_model.dart';
import 'package:default_project/screens/history/info_screen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/app_images.dart';
import '../dialog/request_dialog_remov.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.qrScannerModel});

  final QrScannerModel qrScannerModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.he, horizontal: 10.we),
      child: ListTile(
        trailing: IconButton(
          onPressed: () {
            showDialogRemove(context, qrScannerModel: qrScannerModel);
          },
          icon: Icon(
            Icons.delete,
            size: 22.sp,
            color: AppColors.c_FDB623,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return InfoScreen(qrScannerModel: qrScannerModel);
              },
            ),
          );
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        tileColor: AppColors.c_333333,
        leading: SvgPicture.asset(
          AppImages.qrCode,
          colorFilter: ColorFilter.mode(AppColors.c_FDB623, BlendMode.srcIn),
        ),
        title: Text(
          "Data:",
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          qrScannerModel.qrCode,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
