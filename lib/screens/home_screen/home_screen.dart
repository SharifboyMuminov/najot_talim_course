import 'package:default_project/data/models/city/city_modul.dart';
import 'package:flutter/material.dart';

import '../../data/models/network_response.dart';
import '../../data/repositories/weather_repository.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final WeatherRepository weatherRepository = WeatherRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: weatherRepository.getSimpleWeatherInfo("Chust"),
        builder: (context, AsyncSnapshot<NetworkResponse> snapshop) {
          if (snapshop.hasError) {
            return Center(child: Text("Error"));
          }
          if (snapshop.hasData) {
            CityModul cityModul = (snapshop.data as NetworkResponse).data;

            return Center(
                child:Text(cityModul.name));
          }
          return Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
