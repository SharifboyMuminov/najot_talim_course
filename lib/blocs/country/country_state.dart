import 'package:default_project/data/models/country/countyr_model.dart';

abstract class CountryState {}

class QueryOkState extends CountryState {
  List<CountryModel> countries;

  QueryOkState({required this.countries});
}

class ErrorState extends CountryState {
  String errorText;

  ErrorState({required this.errorText});
}

class LoadingState extends CountryState {}
