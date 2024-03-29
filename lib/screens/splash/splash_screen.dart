import 'package:default_project/data/models/place.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view_models/maps_view_model.dart';
import 'package:default_project/view_models/save_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../tab_box.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        final List<PlaceModel> pl = context.read<SaveLocation>().placeModels;
        context.read<MapsViewModel>().useSqliMark(placeModels: pl);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const TabBoxScreen();
            },
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Text(
          "Hello",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 35.sp,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
