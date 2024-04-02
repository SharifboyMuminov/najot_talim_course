import 'package:default_project/data/api_provider/api_provider.dart';
import 'package:default_project/data/models/bank/bank_model.dart';
import 'package:default_project/data/models/my_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'banc_state.dart';

class BankCubit extends Cubit<BankState> {
  BankCubit() : super(LoadingBankState()){
    getAllData();
  }

  Future<void> getAllData() async {
    emit(LoadingBankState());
    MyResponse myResponse = await ApiProvider.getAllDate();
    if (myResponse.errorText.isEmpty) {
      emit(SuccessBankState(banData: myResponse.data as List<BankModel>));
    } else {
      emit(ErrorBankState(errorText: myResponse.errorText));
    }
  }
}
