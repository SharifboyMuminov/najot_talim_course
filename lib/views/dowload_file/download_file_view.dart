import 'package:default_project/data/models/book/book_model.dart';
import 'package:default_project/data/models/file_status/file_status_model.dart';
import 'package:default_project/services/file_maneger_services/file_maneger_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_filex/open_filex.dart';

class DownloadFileView extends ChangeNotifier {
  double progress = 0.0;

  bool loading = false;

  Future<void> downloadFile({required BookModel bookModel}) async {
    Dio dio = Dio();
    loading = true;

    FileStatusModel fileStatusModel =
        await FileManagerService().checkFile(bookModel);

    if (fileStatusModel.isExist) {
      OpenFilex.open(fileStatusModel.newFileLocation);
    } else {
      await dio.download(bookModel.urlDownload, fileStatusModel.newFileLocation,
          onReceiveProgress: (count, total) {
        progress = (count / total);
        notifyListeners();
      });
      OpenFilex.open(fileStatusModel.newFileLocation);

      progress = 1.0;
      loading = false;
    }
  }
}
