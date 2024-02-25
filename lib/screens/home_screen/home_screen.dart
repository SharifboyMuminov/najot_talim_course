import 'package:default_project/data/models/city/city_modul.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/my_extensions.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/models/network_response.dart';
import '../../data/models/one_call/one_call_models/one_call_data_models.dart';
import '../../data/repositories/weather_repository.dart';
import '../info_screen/info_screen.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherRepository weatherRepository = WeatherRepository();

  OneCallDataModels? oneCallDataModels;
  CityModul? cityModul;
  bool isShowHour = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.c_FFFFFF,
      body: Column(
        children: [
          150.getH(),
          FutureBuilder(
            future: weatherRepository.getSimpleWeatherInfo("Chust"),
            builder: (context, AsyncSnapshot<NetworkResponse> snapshop) {
              if (snapshop.hasError) {
                return Center(
                  child: Text("Error"),
                );
              }
              if (snapshop.hasData) {
                cityModul = (snapshop.data as NetworkResponse).data;

                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.we),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          30.getH(),
                          Text(
                            cityModul!.name,
                            style: TextStyle(
                              color: AppColors.c_313341,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          20.getH(),
                          Text(
                            cityModul!.dt.getParsedDate(),
                            style: TextStyle(
                                color: AppColors.c_9A938C, fontSize: 18.sp),
                          ),
                          Row(
                            children: [
                              Image.network(
                                cityModul!.weatherModul[0].icon
                                    .getWeatherIconUrl(),
                                width: 200.we,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: (cityModul!.mainModul.temp - 273.15)
                                      .toString()
                                      .substring(0, 3),
                                  style: TextStyle(
                                    color: AppColors.c_313341,
                                    fontSize: 40.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " c\n",
                                      style: TextStyle(
                                        color: AppColors.c_313341,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cityModul!.weatherModul[0].maiN,
                                      style: TextStyle(
                                        color: AppColors.c_313341,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/rain_file.svg",
                                width: 60,
                              ),
                              Text(
                                "RainFall",
                                style: TextStyle(
                                  color: AppColors.c_313341,
                                  fontSize: 18.sp,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "${cityModul!.mainModul.humidity}cm",
                                style: TextStyle(
                                  color: AppColors.c_313341,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                          20.getH(),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/wind.svg",
                                width: 60,
                              ),
                              Text(
                                "Wind",
                                style: TextStyle(
                                  color: AppColors.c_313341,
                                  fontSize: 18.sp,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "${(cityModul!.windModul.speed * 3.6).toString().split(".")[0]}cm",
                                style: TextStyle(
                                  color: AppColors.c_313341,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                          20.getH(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/humidity.svg",
                                width: 60,
                              ),
                              Text(
                                "Humidity",
                                style: TextStyle(
                                  color: AppColors.c_313341,
                                  fontSize: 18.sp,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "${cityModul!.mainModul.humidity}%",
                                style: TextStyle(
                                  color: AppColors.c_313341,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                          90.getH(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Today",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.sp,
                                  color: AppColors.c_313341,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (oneCallDataModels != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return InfoScreen(
                                              dailys: oneCallDataModels!
                                                  .dailyModels);
                                        },
                                      ),
                                    );
                                  }
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Next 7 Days",
                                      style: TextStyle(
                                        color: AppColors.c_313341,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    SizedBox(width: 5.we),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: AppColors.c_313341,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    FutureBuilder(
                      future: weatherRepository.getHourlyAndDealiy(
                          cityModul!.coordModul.lat.toString(),
                          cityModul!.coordModul.lon.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.data!.errorText.toString()),
                          );
                        }
                        if (snapshot.hasData) {
                          oneCallDataModels = snapshot.data!.data;

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...List.generate(
                                  oneCallDataModels!.hourlyModels.length,
                                  (index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.network(oneCallDataModels!
                                            .hourlyModels[index]
                                            .inWeather[0]
                                            .icon
                                            .getWeatherIconUrl()),
                                        Text(
                                          "${oneCallDataModels!.hourlyModels[index].temp.round()}c",
                                          style: TextStyle(
                                            color: AppColors.c_313341,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          oneCallDataModels!
                                              .hourlyModels[index].dt
                                              .toInt()
                                              .getParsedHour(),
                                          style: TextStyle(
                                            color: AppColors.c_313341,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      },
                    ),
                  ],
                );
              }
              return Center(child: CircularProgressIndicator.adaptive());
            },
          ),
        ],
      ),
    );
  }
}
