import 'package:default_project/data/models/country/countyr_model.dart';
import 'package:default_project/data/models/network_response.dart';
import 'package:graphql/client.dart';

class ApiClient {
  ApiClient({required this.graphQLClient});

  final GraphQLClient graphQLClient;

  factory ApiClient.create() {
    final _httpLink = HttpLink('https://countries.trevorblades.com');
    final link = Link.from([_httpLink]);
    return ApiClient(
      graphQLClient: GraphQLClient(
        link: link,
        cache: GraphQLCache(),
      ),
    );
  }

  Future<NetworkResponse> getCounties() async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      var result = await graphQLClient.query(QueryOptions(document: gql("""
      query ListCountriesInNAFTA {
  countries {
    code
    name
    emoji
    continent{
      name
    }
  }
}""")));

      if (result.hasException) {
        networkResponse.errorText = "result.hasException Error";
      } else {
        List<CountryModel> countries = (result.data?["countries"] as List?)
                ?.map((e) => CountryModel.fromJson(e))
                .toList() ??
            [];

        countries.removeWhere((element) => element.name == "Israel");
        networkResponse.data = countries;
      }
    } catch (_) {
      networkResponse.errorText = "Error :(";
    }

    return networkResponse;
  }

  Future<NetworkResponse> searchCounties({required String nameCountry}) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      var result = await graphQLClient
          .query(QueryOptions(document: gql("""query ListCountriesInNAFTA {
  countries(filter: { name: { in: ["$nameCountry"] } }) {
    code
    name
    emoji
    continent{
      name
    }
  }
}""")));

      if (result.hasException) {
        networkResponse.errorText = "result.hasException Error";
      } else {
        List<CountryModel> countries = (result.data?["countries"] as List?)
                ?.map((e) => CountryModel.fromJson(e))
                .toList() ??
            [];

        countries.removeWhere((element) => element.name == "Israel");
        networkResponse.data = countries;
      }
    } catch (_) {
      networkResponse.errorText = "Error :(";
    }

    return networkResponse;
  }

  Future<NetworkResponse> searchForLocationCounties(
      {required String nameCountry, required String location}) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      var result = await graphQLClient
          .query(QueryOptions(document: gql("""query ListCountriesInNAFTA {
  countries(filter: { name: { in: ["$nameCountry"] },continent:  {  in: ["$location"] } }) {
    code
    name
    emoji
    continent{
      name
    }
  }
}""")));

      if (result.hasException) {
        networkResponse.errorText = "result.hasException Error";
      } else {
        List<CountryModel> countries = (result.data?["countries"] as List?)
                ?.map((e) => CountryModel.fromJson(e))
                .toList() ??
            [];

        countries.removeWhere((element) => element.name == "Israel");
        networkResponse.data = countries;
      }
    } catch (_) {
      networkResponse.errorText = "Error :(";
    }

    return networkResponse;
  }

  Future<NetworkResponse> getLocationCountry(
      {required String locationCountry}) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      var result = await graphQLClient
          .query(QueryOptions(document: gql("""query ListCountriesInNAFTA {
  countries(filter: { continent:  {  in: ["$locationCountry"] } }) {
    code
    name
    emoji
    continent{
      name
    }
  }
}""")));

      if (result.hasException) {
        networkResponse.errorText = "result.hasException Error";
      } else {
        List<CountryModel> countries = (result.data?["countries"] as List?)
                ?.map((e) => CountryModel.fromJson(e))
                .toList() ??
            [];

        countries.removeWhere((element) => element.name == "Israel");
        networkResponse.data = countries;
      }
    } catch (_) {
      networkResponse.errorText = "Error :(";
    }

    return networkResponse;
  }

  List<CountryModel> getFormatData({required QueryResult<Object?> result}) {
    return (result.data?["countries"] as List?)
            ?.map((e) => CountryModel.fromJson(e))
            .toList() ??
        [];
  }
}
