import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class ImageViewModel extends ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  Future<String> addImageInFireBase(
      {required File file, required String fileName}) async {
    String imageUrl = "";

    final storageRef = FirebaseStorage.instance.ref();

    final imagesRef = storageRef.child(fileName);

    try {
      _changeLoading(true);
      await imagesRef.putFile(file);

      _changeLoading(false);
    } catch (_) {
      _changeLoading(false);

      debugPrint("Error Bo'ldi :(");
    }
    imageUrl = await imagesRef.getDownloadURL();
    _changeLoading(false);

    return imageUrl;
  }

  Future<void> deleteImage({required String path}) async {
    final storageRef = FirebaseStorage.instance.ref();
    var desertRef = storageRef.child(path);
    try {
      await desertRef.delete();
    } catch (_) {
      debugPrint(_.toString());
    }
  }

  _changeLoading(bool v) {
    _loading = v;
    notifyListeners();
  }
}
