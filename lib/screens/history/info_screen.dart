import 'package:default_project/data/models/qr/qr_scanner_model.dart';
import 'package:default_project/screens/history/widget/info_button.dart';
import 'package:default_project/servers/save_image_server.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, required this.qrScannerModel});

  final QrScannerModel qrScannerModel;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_333333.withOpacity(0.7),
      body: Column(
        children: [
          SizedBox(height: 40.he),
          Row(
            children: [
              SizedBox(width: 20.we),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.c_333333,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 22.sp,
                  color: AppColors.c_FDB623,
                ),
              ),
              SizedBox(width: 25.we),
              Text(
                "QR Code",
                style: TextStyle(
                  color: AppColors.c_D9D9D9,
                  fontSize: 27.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 33.he),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.we),
            child: ListTile(
              onTap: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r)),
              tileColor: AppColors.c_333333,
              title: Text(
                "Data:",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                widget.qrScannerModel.qrCode,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 55.he),
          Align(
            alignment: Alignment.center,
            child: RepaintBoundary(
              key: _globalKey,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color: AppColors.c_FDB623, width: 5.we),
                  color: AppColors.c_FFFFFF,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.c_FDB623.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5),
                  ],
                ),
                child: QrImageView(
                  data: widget.qrScannerModel.qrCode,
                  version: QrVersions.auto,
                  size: 200.we,
                ),
              ),
            ),
          ),
          SizedBox(height: 40.he),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InfoButton(onTab: () {}, title: "Share"),
              SizedBox(width: 20.we),
              InfoButton(
                onTab: () {
                  WidgetSaverService.saveWidgetToGallery(
                    context: context,
                    widgetKey:_globalKey,
                    fileId: widget.qrScannerModel.qrCode,
                  );
                },
                title: "Save",
                iconData: Icons.save,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
