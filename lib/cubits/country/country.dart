import 'package:default_project/cubits/country/country_state.dart';
import 'package:default_project/data/api_provider/api_provider.dart';
import 'package:default_project/data/models/my_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit()
      : super(CountryState(
            myStatus: MyStatus.loading, countries: [], errorText: ''));

  Future<void> callCountry() async {
    MyResponse myResponse = await ApiProvider.callAllCountry();
    if (myResponse.errorText.isEmpty) {
      emit(state.copyWith(countries: myResponse.data, myStatus: MyStatus.ok));
    } else {
      emit(state.copyWith(
          myStatus: MyStatus.error, errorText: myResponse.errorText));
    }
  }
}
