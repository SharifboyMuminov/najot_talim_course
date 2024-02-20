import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:default_project/moduls/car_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, required this.id});
  final int id;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  Future<CarInfoModul?> _getCarInfo() async {
    http.Response response;

    try {
      response = await http.get(Uri.parse(
          "https://easyenglishuzb.free.mockoapp.net/companies/${widget.id}"));

      if (response.statusCode == 200) {
        return CarInfoModul.fromJson(jsonDecode(response.body));
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _getCarInfo(),
        builder: (context, AsyncSnapshot<CarInfoModul?> car) {
          if (car.data != null) {
            CarInfoModul carInfoModul = car.data as CarInfoModul;
            return Center(
              child: Text(carInfoModul.id.toString()),
            );
          } else if (car.hasError) {
            return Center(
              child: Text(car.error.toString()),
            );
          } else {
            return CircularProgressIndicator.adaptive();
          }
        },
      ),
    );
  }
}
