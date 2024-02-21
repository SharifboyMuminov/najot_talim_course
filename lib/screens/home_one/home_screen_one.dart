import 'dart:convert';

import 'package:default_project/data/moduls/car_modul.dart';
import 'package:default_project/screens/info_one/info_screen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;


class HomeScreenOne extends StatefulWidget {
  const HomeScreenOne({super.key});

  @override
  State<HomeScreenOne> createState() => _HomeScreenOneState();
}

class _HomeScreenOneState extends State<HomeScreenOne> {
  List<CarModul>? carModuls;

  Future<void> _toMaster() async {
    http.Response response;

    try {
      response = await http
          .get(Uri.parse("https://easyenglishuzb.free.mockoapp.net/companies"));

      if (response.statusCode == 200) {
        carModuls = (jsonDecode(response.body)["data"] as List?)
                ?.map((e) => CarModul.fromJson(e))
                .toList() ??
            [];
        setState(() {});
      }
    } catch (error) {
      print("Error :(");
    }
  }

  @override
  void initState() {
    _toMaster();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: carModuls == null
          ? const Center(child: CircularProgressIndicator.adaptive())
          : SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 30.he),
              child: Column(
                children: [
                  ...List.generate(
                    carModuls!.length,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return InfoScreenOne(id: index + 1);
                                },
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: carModuls![index].logo.isNotEmpty
                                      ? Image.network(carModuls![index].logo)
                                      : Image.asset("assets/images/mers.png"),
                                ),
                              ),
                              SizedBox(height: 20.he),
                              Text(
                                "Car modul: ${carModuls![index].carModel}",
                                style: TextStyle(
                                  color: AppColors.c_4A66AC,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Car established year: ${carModuls![index].establishedYear}",
                                style: TextStyle(
                                  color: AppColors.c_4A66AC,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Price: ${carModuls![index].averagePrice} \$",
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
            ),
    );
  }
}
