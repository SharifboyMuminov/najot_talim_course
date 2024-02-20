import 'dart:convert';

import 'package:default_project/moduls/car_info.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _getCarInfo(),
        builder: (context, AsyncSnapshot<CarInfoModul?> car) {
          if (car.data != null) {
            CarInfoModul carInfoModul = car.data as CarInfoModul;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  60.getH(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.we),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Car model ${carInfoModul.carModel}",
                          style: TextStyle(
                            color: AppColors.c_4A66AC,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 3.he),
                        Text(
                          "Car established year ${carInfoModul.establishedYear}",
                          style: TextStyle(
                            color: AppColors.c_4A66AC,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Price: ${carInfoModul.averagePrice} \$",
                          style: TextStyle(
                            color: AppColors.c_4A66AC,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  30.getH(),
                  SizedBox(
                    height: 300.he,
                    child: PageView(
                      children: [
                        ...List.generate(
                          carInfoModul.carPics.length,
                          (index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 15.he, horizontal: 10.we),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: Image.network(
                                  carInfoModul.carPics[index],
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  30.getH(),
                  Center(
                    child: Text(
                      "Description",
                      style: TextStyle(
                        color: AppColors.c_4A66AC,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  10.getH(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.we),
                    child: Text(
                      carInfoModul.description,
                      style: TextStyle(
                        color: AppColors.c_4A66AC.withOpacity(0.7),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  20.getH(),
                ],
              ),
            );
          } else if (car.hasError) {
            return Center(child: Text(car.error.toString()));
          } else {
            return Center(child: CircularProgressIndicator.adaptive());
          }
        },
      ),
    );
  }
}
