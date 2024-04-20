import 'dart:io';
import 'package:default_project/blocs/qr_data_bloc/qr_bloc_event.dart';
import 'package:default_project/blocs/qr_data_bloc/qr_data_bloc.dart';
import 'package:default_project/data/local/local_varibals.dart';
import 'package:default_project/data/models/qr/qr_scanner_model.dart';
import 'package:default_project/screens/history/info_screen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key, required this.onSet});

  final VoidCallback onSet;

  @override
  State<StatefulWidget> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: (controller) {
                    setState(
                      () {
                        this.controller = controller;
                      },
                    );
                    controller.scannedDataStream.listen(
                      (scanData) {
                        controller.pauseCamera();
                        // debugPrint("scanData.format ${scanData.format}");
                        globalActiveScreen = 1;
                        widget.onSet.call();

                        QrScannerModel qrModel = QrScannerModel(
                          date: DateTime.now().toString(),
                          qrCode: scanData.code.toString(),
                          name: "Null",
                        );
                        context
                            .read<QrDataBloc>()
                            .add(QrInsertDataEvent(qrScannerModel: qrModel));
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return InfoScreen(qrScannerModel: qrModel);
                            },
                          ),
                        );
                      },
                    );
                  },
                  overlay: QrScannerOverlayShape(
                    borderColor: AppColors.c_FDB623,
                    borderRadius: 10,
                    borderLength: 80,
                    borderWidth: 20,
                    cutOutSize: MediaQuery.of(context).size.width - 90,
                  ),
                  onPermissionSet: (ctrl, p) {
                    // log('${DateTime.now().toIso8601String()}_onPermissionSet ${p}');
                    if (!p) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('no Permission'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 10.we, top: 50.he),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () async {
                  await controller?.toggleFlash();
                  setState(() {});
                },
                icon: Icon(
                  Icons.lightbulb_outlined,
                  size: 30.sp,
                  color: AppColors.c_FFFFFF,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
