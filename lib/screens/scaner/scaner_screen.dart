import 'dart:developer';
import 'dart:io';

import 'package:default_project/blocs/qr_data_bloc/qr_bloc_event.dart';
import 'package:default_project/blocs/qr_data_bloc/qr_data_bloc.dart';
import 'package:default_project/data/local/local_varibals.dart';
import 'package:default_project/data/models/qr/qr_scanner_model.dart';
import 'package:default_project/screens/tab_box/tab_box.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

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
      body: Padding(
        padding: EdgeInsets.only(bottom: 90.he),
        child: Column(
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

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            QrScannerModel qrModel = QrScannerModel(
                              date: DateTime.now().toString(),
                              qrCode: scanData.code.toString(),
                              name: "Null",
                            );

                            context.read<QrDataBloc>().add(
                                QrInsertDataEvent(qrScannerModel: qrModel));
                            globalActiveScreen = 1;
                            return const TabBoxScreen();
                          },
                        ),
                      );
                    },
                  );
                },
                overlay: QrScannerOverlayShape(
                  borderColor: AppColors.c_FDB623,
                  borderRadius: 16,
                  borderLength: 80,
                  borderWidth: 30,
                  cutOutSize: MediaQuery.of(context).size.width - 32,
                ),
                onPermissionSet: (ctrl, p) {
                  // log('${DateTime.now().toIso8601String()}_onPermissionSet ${p}');
                  if (!p) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('no Permission')),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        await controller?.toggleFlash();
                        setState(() {});
                      },
                      child: FutureBuilder(
                        future: controller?.getFlashStatus(),
                        builder: (context, snapshot) {
                          return Text('Flash: ${snapshot.data}');
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        await controller?.flipCamera();
                        setState(() {});
                      },
                      child: FutureBuilder(
                        future: controller?.getCameraInfo(),
                        builder: (context, snapshot) {
                          if (snapshot.data != null) {
                            return Text(
                                'Camera facing ${describeEnum(snapshot.data!)}');
                          } else {
                            return const Text('loading');
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        await controller?.pauseCamera();
                      },
                      child:
                          const Text('pause', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        await controller?.resumeCamera();
                      },
                      child:
                          const Text('resume', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
