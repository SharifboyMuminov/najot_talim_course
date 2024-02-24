import 'package:default_project/data/models/timezone/daily/feels_like/feels_like_modul.dart';
import 'package:default_project/data/models/timezone/daily/temp/temp_modul.dart';
import 'package:default_project/data/models/weather/weather_modul.dart';

class DailyModul {
  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  final double moonPhase;
  final TempModul tempModul;
  final FeelsLikeModul feelsLikeModul;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<WeatherModul> weatherModul;
  final double clouds;
  final double pop;
  final double snow;
  final double uvi;

  DailyModul({
    required this.clouds,
    required this.dewPoint,
    required this.dt,
    required this.feelsLikeModul,
    required this.humidity,
    required this.moonPhase,
    required this.moonrise,
    required this.moonset,
    required this.pop,
    required this.pressure,
    required this.snow,
    required this.sunrise,
    required this.sunset,
    required this.tempModul,
    required this.uvi,
    required this.weatherModul,
    required this.windDeg,
    required this.windGust,
    required this.windSpeed,
  });

  factory DailyModul.fromJson(Map<String, dynamic> json) {
    return DailyModul(
        clouds: clouds,
        dewPoint: dewPoint,
        dt: json["dt"] as int? ?? 0,
        feelsLikeModul: feelsLikeModul,
        humidity: humidity,
        moonPhase: moonPhase,
        moonrise: moonrise,
        moonset: moonset,
        pop: json["pop"] as double? ?? 0,
        pressure: pressure,
        snow: json["snow"] as double? ?? 0,
        sunrise: sunrise,
        sunset: sunset,
        tempModul: tempModul,
        uvi: uvi,
        weatherModul: weatherModul,
        windDeg: windDeg,
        windGust: windGust,
        windSpeed: windSpeed);
  }
}



// "dt": 1708758000,
// "sunrise": 1708740403,
// "sunset": 1708779983,
// "moonrise": 1708779480,
// "moonset": 1708741020,
// "moon_phase": 0.5,

// "pressure": 1031,
// "humidity": 99,
// "dew_point": 274.47,
// "wind_speed": 2.24,
// "wind_deg": 351,
// "wind_gust": 2.66,

// "clouds": 100,
// "pop": 0.86,
// "snow": 4.83,
// "uvi": 1.57