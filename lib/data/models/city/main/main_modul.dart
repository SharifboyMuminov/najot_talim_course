class MainModul {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  MainModul(
      {required this.feelsLike,
      required this.humidity,
      required this.pressure,
      required this.temp,
      required this.tempMax,
      required this.tempMin});

  factory MainModul.fomJson(Map<String, dynamic> json) {
    return MainModul(
        feelsLike: json["feels_like"] as double? ?? 0.0,
        humidity: json["humidity"] as int? ?? 0,
        pressure: json["pressure"] as int? ?? 0,
        temp: json["temp"] as double? ?? 0.0,
        tempMax: json["temp_max"] as double? ?? 0.0,
        tempMin: json["temp_min"] as double? ?? 0.0);
  }
}
