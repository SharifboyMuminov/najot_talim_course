import 'package:default_project/data/models/qr/qr_scanner_model.dart';

abstract class QrDataEvent {}

class QrCallDataEvent extends QrDataEvent {}

class QrInsertDataEvent extends QrDataEvent {
  QrScannerModel qrScannerModel;

  QrInsertDataEvent({required this.qrScannerModel});
}

class QrDeleteEvent extends QrDataEvent {
  QrScannerModel qrScannerModel;

  QrDeleteEvent({required this.qrScannerModel});
}
