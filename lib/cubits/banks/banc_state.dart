abstract class BankState {}

class ErrorBankState extends BankState {
  String errorText;

  ErrorBankState({required this.errorText});
}

class LoadingBankState extends BankState {}

class SuccessBankState extends BankState {}
