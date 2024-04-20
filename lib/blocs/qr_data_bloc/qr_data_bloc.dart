import 'package:default_project/blocs/qr_data_bloc/qr_bloc_event.dart';
import 'package:default_project/blocs/qr_data_bloc/qr_bloc_state.dart';
import 'package:default_project/data/local/sqflite_data.dart';
import 'package:default_project/data/models/network_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QrDataBloc extends Bloc<QrDataEvent, QrDataState> {
  QrDataBloc() : super(QrLoadingState()) {
    on<QrCallDataEvent>(_callData);
    on<QrInsertDataEvent>(_insertData);
    on<QrDeleteEvent>(_deleteDate);
  }

  _callData(QrCallDataEvent qrCallDataEvent, emit) async {
    emit(QrLoadingState());
    NetworkResponse networkResponse =
        await LocalDatabase.getAllQrScannerModels();
    if (networkResponse.errorText.isEmpty) {
      emit(QrSuccessState(qrModels: networkResponse.data));
    } else {
      emit(QrErrorState(errorText: networkResponse.errorText));
    }
  }

  _insertData(QrInsertDataEvent qrInsertDataEvent, emit) async {
    emit(QrLoadingState());
    NetworkResponse networkResponse = await LocalDatabase.insertQrScannerModel(
        qrInsertDataEvent.qrScannerModel);
    if (networkResponse.errorText.isEmpty) {
      add(QrCallDataEvent());
    } else {
      emit(QrErrorState(errorText: networkResponse.errorText));
      await Future.delayed(const Duration(seconds: 3));
      add(QrCallDataEvent());
    }
  }

  _deleteDate(QrDeleteEvent qrInsertDataEvent, emit) async {
    if (qrInsertDataEvent.qrScannerModel.id != null) {
      emit(QrLoadingState());
      NetworkResponse networkResponse =
          await LocalDatabase.deleteQrScannerModel(
              qrInsertDataEvent.qrScannerModel.id!);
      if (networkResponse.errorText.isEmpty) {
        add(QrCallDataEvent());
      } else {
        emit(QrErrorState(errorText: networkResponse.errorText));
        await Future.delayed(const Duration(seconds: 3));
        add(QrCallDataEvent());
      }
    }
  }
}
