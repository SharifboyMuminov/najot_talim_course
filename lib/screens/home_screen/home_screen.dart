import 'package:default_project/data/models/city/city_modul.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/my_extensions.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String searcheText = "Chust";
  TextEditingController controllerSearche = TextEditingController();

  @override
  void initState() {
    controllerSearche.text = "Chust";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.width;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              120.getH(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: controllerSearche,
                  onEditingComplete: () {
                    setState(() {
                      searcheText = controllerSearche.text;
                    });
                  },
                  style: Theme.of(context).textTheme.headlineMedium,
                  cursorColor: AppColors.c_313341,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide:
                          BorderSide(color: AppColors.c_313341, width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide:
                          BorderSide(color: AppColors.c_313341, width: 1.5),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          controllerSearche.clear();
                        });
                      },
                      icon: SvgPicture.asset(
                        "assets/icons/xmark.svg",
                        width: 25,
                        height: 25,
                      ),
                    ),
                    prefixIcon: SvgPicture.asset(
                      "assets/icons/searche.svg",
                      width: 10,
                      height: 10,
                      colorFilter:
                          ColorFilter.mode(AppColors.c_313341, BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
              50.getH(),
              FutureBuilder(
                future: weatherRepository.getSimpleWeatherInfo(searcheText),
                builder: (context, AsyncSnapshot<NetworkResponse> snapshop) {
                  if (snapshop.hasError) {
                    return Center(
                      child: Text("Error"),
                    );
                  }
                  if (snapshop.hasData) {
                    if (snapshop.data!.data != null) {
                      cityModul = (snapshop.data as NetworkResponse).data;

                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.we),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                30.getH(),
                                Text(cityModul!.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge),
                                20.getH(),
                                Text(cityModul!.dt.getParsedDate(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                Row(
                                  children: [
                                    Image.network(
                                      cityModul!.weatherModul[0].icon
                                          .getWeatherIconUrl(),
                                      width: 200.we,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text:
                                            (cityModul!.mainModul.temp - 273.15)
                                                .toString()
                                                .substring(0, 3),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
                                        children: [
                                          TextSpan(
                                              text: " c\n",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium),
                                          TextSpan(
                                              text: cityModul!
                                                  .weatherModul[0].maiN,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge),
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
                                    Text("RainFall",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                    const Spacer(),
                                    Text("${cityModul!.mainModul.humidity}cm",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                    const Spacer(),
                                    Text(
                                        "${(cityModul!.windModul.speed * 3.6).toString().split(".")[0]}cm",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
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
                                    Text("Humidity",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium),
                                    const Spacer(),
                                    Text("${cityModul!.mainModul.humidity}%",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                  ],
                                ),
                                90.getH(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Today",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
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
                                          Text("Next 7 Days",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium),
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
                                  child:
                                      Text(snapshot.data!.errorText.toString()),
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
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium),
                                              Text(
                                                  oneCallDataModels!
                                                      .hourlyModels[index].dt
                                                      .toInt()
                                                      .getParsedHour(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium),
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
                  }
                  return Center(child: CircularProgressIndicator.adaptive());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
