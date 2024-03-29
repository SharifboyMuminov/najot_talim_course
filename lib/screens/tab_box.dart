import 'package:default_project/screens/googl_maps/google_map_screen.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view_models/index_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../data/models/place.dart';
import '../view_models/maps_view_model.dart';
import '../view_models/save_location.dart';
import 'my_location/my_location_screen.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  final List<Widget> _screens = [
    GoogleMapsScreen(),
    MyLocationScreen(),
  ];

  @override
  void initState() {
    Future.microtask(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var providerListenActiveScreen = Provider.of<ActiveIndexScreen>(context);
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: providerListenActiveScreen.activeIndex,
            children: _screens,
          ),
          // _screens[providerListenActiveScreen.activeIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(left: 20.we, right: 90.we, bottom: 20.he),
              padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 20.he),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _getButton(
                    onTab: () {
                      providerListenActiveScreen.chaneIndex(0);
                      setState(() {});
                    },
                    icon: Icons.map,
                    active: providerListenActiveScreen.activeIndex == 0,
                  ),
                  _getButton(
                    onTab: () {
                      providerListenActiveScreen.chaneIndex(1);
                      setState(() {});
                    },
                    icon: Icons.save,
                    active: providerListenActiveScreen.activeIndex == 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getButton(
      {required VoidCallback onTab,
      required IconData icon,
      required bool active}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onTab,
          icon: Icon(
            icon,
            size: 24.sp,
          ),
        ),
        if (active)
          Container(
            width: 5.we,
            height: 5.we,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
