import 'package:default_project/data/models/bank/bank_model.dart';

abstract class BankState {}

class ErrorBankState extends BankState {
  String errorText;

  ErrorBankState({required this.errorText});
}

class LoadingBankState extends BankState {}

class SuccessBankState extends BankState {
  List<BankModel> banData;

  SuccessBankState({required this.banData});
}
