import 'dart:convert';

import 'package:default_project/moduls/car_modul.dart';
import 'package:default_project/screens/info/info_screen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<CarModul>?> _getCarModul() async {
    http.Response response;

    try {
      response = await http
          .get(Uri.parse("https://easyenglishuzb.free.mockoapp.net/companies"));

      if (response.statusCode == 200) {
        return (jsonDecode(response.body)["data"] as List?)
                ?.map((e) => CarModul.fromJson(e))
                .toList() ??
            [];
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: FutureBuilder(
        future: _getCarModul(),
        builder: (BuildContext context, AsyncSnapshot<List<CarModul>?> data) {
          if (data.hasError) {
            return Text(data.hasError.toString());
          }
          if (data.hasData) {
            List<CarModul> cars = data.data as List<CarModul>;
            return Expanded(
              child: ListView(
                children: [
                  ...List.generate(
                    cars.length,
                    (index) {
                      return Container(
                        height: 220,
                        margin: EdgeInsets.symmetric(
                            vertical: 20.he, horizontal: 24.we),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.we, vertical: 20.he),
                            backgroundColor: AppColors.c_F2F3F2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return InfoScreen(id: index + 1);
                            }));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: cars[index].logo.isNotEmpty
                                      ? Image.network(cars[index].logo)
                                      : Image.asset("assets/images/mers.png"),
                                ),
                              ),
                              SizedBox(height: 20.he),
                              Text(
                                "Car modul: ${cars[index].carModel}",
                                style: TextStyle(
                                  color: AppColors.c_4A66AC,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Car established year: ${cars[index].establishedYear}",
                                style: TextStyle(
                                  color: AppColors.c_4A66AC,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Price: ${cars[index].averagePrice} \$",
                                style: TextStyle(
                                  color: AppColors.c_4A66AC,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
