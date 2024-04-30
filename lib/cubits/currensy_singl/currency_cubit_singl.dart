import 'package:default_project/cubits/currensy_singl/currency_cubit_singl_state.dart';
import 'package:default_project/data/models/currency/currency_model.dart';
import 'package:default_project/data/models/network_response.dart';
import 'package:default_project/data/network/api_provider.dart';
import 'package:default_project/data/sqlife_data/sqlife_data.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyCubitSingl extends Cubit<CurrencyCubitSinglState> {
  CurrencyCubitSingl()
      : super(
          CurrencyCubitSinglState(
            loading: false,
            errorText: '',
            currencyModels: [],
          ),
        );

  static List<CurrencyModel> localCurrencies = [];
  static bool updateData = true;

  Future<void> callCurrency() async {
    getLocalData();
    emit(state.copyWith(loading: true));
    NetworkResponse networkResponse = await ApiProvider.getCurrency();
    if (networkResponse.errorText.isEmpty) {
      // debugPrint(networkResponse.data);
      emit(state.copyWith(
          loading: false,
          currencyModels: networkResponse.data as List<CurrencyModel>));
    }
    changeData();
  }

  Future<void> getLocalData() async {
    NetworkResponse networkResponse =
        await LocalDatabase.getAllQrScannerModels();
    if (networkResponse.errorText.isEmpty) {
      // debugPrint("Qonday");
      localCurrencies = networkResponse.data;
    }
  }

  Future<void> changeData() async {
    if (localCurrencies.isEmpty) {
      localCurrencies = state.currencyModels;
      for (CurrencyModel currencyModel in localCurrencies) {
        await LocalDatabase.insertQrScannerModel(currencyModel);
      }
    }
    if (state.currencyModels.isNotEmpty) {
      if (updateData) {
        if (localCurrencies.isEmpty) {
          NetworkResponse networkResponse =
              await LocalDatabase.getAllQrScannerModels();
          localCurrencies = networkResponse.data;
        }
        debugPrint("updateData-----------");
        List<CurrencyModel> c = state.currencyModels;
        for (CurrencyModel currencyModelLocal in localCurrencies) {
          for (CurrencyModel currencyModel in c) {
            if (currencyModelLocal.spotTheDifference(
                currencyModel: currencyModel)) {
              await LocalDatabase.updateCurrency(currencyModel: currencyModel);
              break;
            }
          }
        }
        updateData = false;
      }
    }
    if (state.currencyModels.isEmpty) {
      // debugPrint(
      //     "emit(state.copyWith(currencyModels: localCurrencies))----------");
      if (localCurrencies.isEmpty) {
        NetworkResponse networkResponse =
            await LocalDatabase.getAllQrScannerModels();
        localCurrencies = networkResponse.data;
      }

      emit(state.copyWith(
          currencyModels: localCurrencies, loading: false, errorText: ""));
    }
  }

  errorConnectInternet() async {
    if (localCurrencies.isEmpty) {
      NetworkResponse networkResponse =
          await LocalDatabase.getAllQrScannerModels();
      emit(state.copyWith(
        currencyModels: networkResponse.data,
        loading: false,
        errorText: "",
      ));
    } else {
      emit(state.copyWith(
        currencyModels: localCurrencies,
        loading: false,
        errorText: "",
      ));
    }
  }
}
