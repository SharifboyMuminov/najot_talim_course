import 'package:default_project/blocs/country/country_event.dart';
import 'package:default_project/blocs/country/country_state.dart';
import 'package:default_project/data/api_client/api_client.dart';
import 'package:default_project/data/models/network_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc({required this.apiClient}) : super(LoadingState()) {
    on<CallCountry>(_getCountries);
    on<SearchCountry>(_searchCountries);
    on<LocationCountry>(_callLocationCountry);
  }

  ApiClient apiClient;

  Future<void> _getCountries(CallCountry event, emit) async {
    emit(LoadingState());
    NetworkResponse networkResponse = await apiClient.getCounties();
    if (networkResponse.errorText.isEmpty) {
      emit(QueryOkState(countries: networkResponse.data));
    } else {
      emit(ErrorState(errorText: networkResponse.errorText));
    }
  }

  Future<void> _searchCountries(SearchCountry event, emit) async {
    if (event.nameCountry.isNotEmpty) {
      emit(LoadingState());

      NetworkResponse networkResponse = NetworkResponse();
      if (event.location.isEmpty) {
        networkResponse =
            await apiClient.searchCounties(nameCountry: event.nameCountry);
      } else {
        networkResponse = await apiClient.searchForLocationCounties(
            nameCountry: event.nameCountry, location: event.location);
      }
      if (networkResponse.errorText.isEmpty) {
        emit(QueryOkState(countries: networkResponse.data));
      } else {
        emit(ErrorState(errorText: networkResponse.errorText));
      }
    } else {
      if (event.location.isEmpty) {
        add(CallCountry());
      } else {
        add(LocationCountry(locationCountry: event.location));
      }
    }
  }

  Future<void> _callLocationCountry(LocationCountry event, emit) async {
    emit(LoadingState());
    NetworkResponse networkResponse = await apiClient.getLocationCountry(
        locationCountry: event.locationCountry);
    if (networkResponse.errorText.isEmpty) {
      emit(QueryOkState(countries: networkResponse.data));
    } else {
      emit(ErrorState(errorText: networkResponse.errorText));
    }
  }
}
