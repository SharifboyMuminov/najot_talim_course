import 'package:default_project/screens/widgets/my_navigator.dart';
import 'package:default_project/view_models/location.dart';
import 'package:default_project/view_models/maps_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../googl_maps/google_map_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextButton(
        onPressed: () {
          LatLng? latLng = context.read<LocationViewModel>().latLng;
          if (latLng != null) {
            myNavigatorPush(
              context,
              widget: GoogleMapsScreen(
                latLng: latLng,
              ),
            );
          }
        },
        child: Text("asdfaf"),
      ),
    ));
  }
}
