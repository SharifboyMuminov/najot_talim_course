import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class MyPermission {
  static getStoragePermission({bool retry = false}) async {
    final info = await DeviceInfoPlugin().androidInfo;
    if (Platform.isAndroid && info.version.sdkInt > 29) {
      await Permission.manageExternalStorage.request();
    } else {
      await Permission.storage.request();
    }
    final OnAudioQuery _audioQuery = OnAudioQuery();
    // The param 'retryRequest' is false, by default.
    return await _audioQuery.checkAndRequest(
      retryRequest: retry,
    );
  }
}
