import '../../weather/weather_modul.dart';

class HourlyModul {
  final int date;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final int uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<WeatherModul> weathers;
  final int pop;

  HourlyModul({
    required this.clouds,
    required this.date,
    required this.dewPoint,
    required this.feelsLike,
    required this.humidity,
    required this.pop,
    required this.pressure,
    required this.temp,
    required this.uvi,
    required this.visibility,
    required this.weathers,
    required this.windDeg,
    required this.windGust,
    required this.windSpeed,
  });

  factory HourlyModul.fromJson(Map<String, dynamic> json) {
    return HourlyModul(
        clouds: json["clouds"] as int? ?? 0,
        date: json["dt"] as int? ?? 0,
        dewPoint: json["dew_point"] as double? ?? 0.0,
        feelsLike: json["feels_like"] as double? ?? 0.0,
        humidity: json["humidity"] as int? ?? 0,
        pop: json["pop"] as int? ?? 0,
        pressure: json["pressure"] as int? ?? 0,
        temp: json["temp"] as double? ?? 0.0,
        uvi: json["uvi"] as int? ?? 0,
        visibility: json["visibility"] as int? ?? 0,
        weathers: (json["weather"] as List?)
                ?.map((e) => WeatherModul.fromJson(e))
                .toList() ??
            [],
        windDeg: json["wind_deg"] as int? ?? 0,
        windGust: json["wind_gust"] as double? ?? 0.0,
        windSpeed: json["wind_speed"] as double? ?? 0.0);
  }
}

// "dt": 1708797600,
// "temp": 274.05,
// "feels_like": 274.05,
// "pressure": 1028,
// "humidity": 86,
// "dew_point": 272.12,
// "uvi": 0,
// "clouds": 100,
// "visibility": 10000,
// "wind_speed": 0.63,
// "wind_deg": 295,
// "wind_gust": 0.94,
// "weather": [
// {
// "id": 804,
// "main": "Clouds",
// "description": "overcast clouds",
// "icon": "04n"
// }
// ],
// "pop": 0
// },