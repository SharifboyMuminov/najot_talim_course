import 'package:default_project/data/models/qr/qr_scanner_model.dart';
import 'package:default_project/screens/history/widget/info_button.dart';
import 'package:default_project/servers/save_image_server.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, required this.qrScannerModel});

  final QrScannerModel qrScannerModel;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final GlobalKey _globalKey = GlobalKey(debugLabel: "sharifjon");

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
              onTap: () async {
                // debugPrint(widget.qrScannerModel.qrCode);
                Uri url = Uri.parse(widget.qrScannerModel.qrCode);
                launchUrl(url);
              },
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
          RepaintBoundary(
            key: _globalKey,
            child: Align(
              alignment: Alignment.center,
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
              InfoButton(
                  onTab: () {
                    WidgetSaverService.openWidgetAsImage(
                      context: context,
                      widgetKey: _globalKey,
                      fileId: widget.qrScannerModel.qrCode,
                    );
                  },
                  title: "Share"),
              SizedBox(width: 20.we),
              InfoButton(
                onTab: () {
                  WidgetSaverService.saveWidgetToGallery(
                    context: context,
                    widgetKey: _globalKey,
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

  Future<void> openUrl(String url) async {
    final _url = Uri.parse(url);
    Link(
      uri: _url,
      builder: (BuildContext context, Future<void> Function()? followLink) =>
          TextButton(onPressed: () {}, child: Text("sdaf")),
      target: LinkTarget.defaultTarget,
    );
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }
}
