import 'package:default_project/data/models/country/country.dart';

class CountryState {
  List<CountryModel> countries;
  MyStatus myStatus;
  String errorText;

  CountryState({
    required this.myStatus,
    required this.countries,
    required this.errorText,
  });

  CountryState copyWith({
    List<CountryModel>? countries,
    MyStatus? myStatus,
    String? errorText,
  }) {
    return CountryState(
      countries: countries ?? this.countries,
      myStatus: myStatus ?? this.myStatus,
      errorText: errorText ?? this.errorText,
    );
  }
}

enum MyStatus {
  loading,
  error,
  ok,
}
