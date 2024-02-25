import '../models/network_response.dart';
import '../network/api_provider.dart';

class WeatherRepository {
  Future<NetworkResponse> getSimpleWeatherInfo(String city) =>
      ApiProvider.getSimpleWeatherInfo(city);

  Future<NetworkResponse> getHourlyAndDealiy() =>
      ApiProvider.getComplexWeatherInfo();
}
