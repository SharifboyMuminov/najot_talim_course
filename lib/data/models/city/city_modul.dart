import 'package:default_project/data/models/city/clouds/clouds_modul.dart';
import 'package:default_project/data/models/city/main/main_modul.dart';
import 'package:default_project/data/models/city/sys/sys_mudul.dart';
import 'package:default_project/data/models/weather/weather_modul.dart';
import 'package:default_project/data/models/city/wind/wind_modul.dart';

import 'coord/coord_modul.dart';

class CityModul {
  final CoordModul coordModul;
  final List<WeatherModul> weatherModul;
  final String base;
  final MainModul mainModul;
  final int visibility;
  final WindModul windModul;
  final CloudsModul cloudsModul;
  final int dt;
  final SysModul sysModul;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  CityModul(
      {required this.base,
      required this.cloudsModul,
      required this.cod,
      required this.coordModul,
      required this.dt,
      required this.id,
      required this.mainModul,
      required this.name,
      required this.sysModul,
      required this.timezone,
      required this.visibility,
      required this.weatherModul,
      required this.windModul});

  factory CityModul.fromJson(Map<String, dynamic> json) {
    return CityModul(
      base: json["base"] as String? ?? "",
      cloudsModul: CloudsModul.fromJson(json["clouds"]),
      cod: json["cod"] as int? ?? 0,
      coordModul: CoordModul.fromJson(json["coord"]),
      dt: json["dt"] as int? ?? 0,
      id: json["id"] as int? ?? 0,
      mainModul: MainModul.fomJson(json["main"]),
      name: json["name"] as String? ?? "",
      sysModul: SysModul.fromJson(json["sys"]),
      timezone: json["timezone"] as int? ?? 0,
      visibility: json["visibility"] as int? ?? 0,
      weatherModul: (json["weather"] as List?)
              ?.map((e) => WeatherModul.fromJson(e))
              .toList() ??
          [],
      windModul: WindModul.fromJson(json["wind"]),
    );
  }
}
