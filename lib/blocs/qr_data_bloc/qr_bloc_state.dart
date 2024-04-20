import 'package:default_project/data/models/qr/qr_scanner_model.dart';

abstract class QrDataState {}

class QrSuccessState extends QrDataState {
  List<QrScannerModel> qrModels;

  QrSuccessState({required this.qrModels});
}

class QrErrorState extends QrDataState {
  QrErrorState({required this.errorText});

  String errorText;
}

class QrLoadingState extends QrDataState {}
