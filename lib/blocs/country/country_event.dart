abstract class CountryEvent {}

class CallCountry extends CountryEvent {}

class SearchCountry extends CountryEvent {
  String nameCountry;
  String location;

  SearchCountry({required this.nameCountry, this.location = ""});
}

class LocationCountry extends CountryEvent {
  String locationCountry;

  LocationCountry({required this.locationCountry});
}
