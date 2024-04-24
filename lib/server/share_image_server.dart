import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';

class WidgetSaverService {
  static Future<void> openWidgetAsImage({
    required BuildContext context,
    required GlobalKey widgetKey,
    required String fileId,
  }) async {
    String filePath = '';

    showLoading(context: context);

    var storageStatus = await Permission.storage.status;
    if (storageStatus == PermissionStatus.denied) {
      await Permission.storage.request();
    }

    String dir = (Platform.isAndroid
            ? await getExternalStorageDirectory()
            : await getApplicationSupportDirectory())!
        .path;
    if (!context.mounted) return;
    RenderRepaintBoundary boundary =
        widgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData byteData =
        (await image.toByteData(format: ui.ImageByteFormat.png)) as ByteData;
    Uint8List pngBytes = byteData.buffer.asUint8List();
    File file = File('$dir/cheque-$fileId.png');
    debugPrint('$dir/cheque-$fileId.png');
    filePath = file.path;
    await file.writeAsBytes(pngBytes);

    if (!context.mounted) return;
    hideLoading(context: context);
    if (filePath.isNotEmpty) {
      //Open File
      OpenFilex.open(filePath);
      // Save image to Gallery
      //  GallerySaver.saveImage(filePath).then((value) {
      //    showSuccessMessage(message: "Image Saved", context: context);
      //  });
    } else {
      showSuccessMessage(
        message: "Error",
        context: context,
      );
    }
  }
}

void showLoading({required BuildContext context}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          alignment: AlignmentDirectional.center,
          decoration: const BoxDecoration(),
          child: const Center(
            child: SizedBox(
              height: 40.0,
              width: 40.0,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
    },
  );
}

void hideLoading({required BuildContext context}) {
  Navigator.pop(context);
}

void showSuccessMessage({
  required String message,
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text(
        "MESSAGE",
        style: TextStyle(fontWeight: FontWeight.w800),
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          isDefaultAction: true,
          child: const Text("Ok"),
        )
      ],
    ),
  );
}
