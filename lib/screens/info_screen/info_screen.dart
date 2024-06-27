import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:default_project/screens/info_screen/widgets/pogoda.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/my_extensions.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/local/storage_repository.dart';
import '../../data/models/one_call/daily_models.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, required this.dailys});
  final List<DailyModels> dailys;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  late List<DailyModels> dailys;
  bool isActiv = false;

  @override
  void initState() {
    dailys = widget.dailys;
    isActiv = StorageRepository.getBool(key: "them");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    week = dateTime.weekday + 1;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Switch.adaptive(
            value: isActiv,
            onChanged: (v) {
              if (v) {
                AdaptiveTheme.of(context).setDark();
              } else {
                AdaptiveTheme.of(context).setLight();
              }
              StorageRepository.setBool(key: 'them', value: v);
              isActiv = v;
              setState(() {});
            },
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.c_313341,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 20.he),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.we, vertical: 30.he),
              decoration: BoxDecoration(
                // color: AppColors.c_FFFFFF,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Tommorow",
                          style: Theme.of(context).textTheme.headlineMedium),
                      Spacer(),
                      Text("${(dailys[0].tempModel.day).round()}c",
                          style: Theme.of(context).textTheme.titleLarge),
                      Image.network(
                          dailys[0].inWeatherModel[0].icon.getWeatherIconUrl()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Pgoda(
                        icon: 'assets/icons/rain_file.svg',
                        text: '3c',
                      ),
                      Pgoda(
                        icon: 'assets/icons/wind.svg',
                        text: '15km/h',
                      ),
                      Pgoda(
                        icon: 'assets/icons/humidity.svg',
                        text: '64%',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.he),
            ...List.generate(
              dailys.length - 1,
              (index) {
                return Row(
                  children: [
                    Text(1.getWeekdayName(week),
                        style: Theme.of(context).textTheme.headlineSmall),
                    Spacer(),
                    Text(("${(dailys[index + 1].tempModel.day).round()}c"),
                        style: Theme.of(context).textTheme.titleLarge),
                    Image.network(dailys[index + 1]
                        .inWeatherModel[0]
                        .icon
                        .getWeatherIconUrl()),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
