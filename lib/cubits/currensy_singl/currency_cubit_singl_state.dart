import 'package:default_project/data/models/currency/currency_model.dart';

class CurrencyCubitSinglState {
  List<CurrencyModel> currencyModels;
  bool loading;
  String errorText;

  CurrencyCubitSinglState({
    required this.loading,
    required this.errorText,
    required this.currencyModels,
  });

  CurrencyCubitSinglState copyWith({
    List<CurrencyModel>? currencyModels,
    bool? loading,
    String? errorText,
  }) {
    return CurrencyCubitSinglState(
      loading: loading ?? this.loading,
      errorText: errorText ?? this.errorText,
      currencyModels: currencyModels ?? this.currencyModels,
    );
  }
}
