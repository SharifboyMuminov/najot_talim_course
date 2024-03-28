import 'package:default_project/view_models/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({super.key});

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  CameraPosition? cameraPosition;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    Future.microtask(() {
      LatLng? latLng = context.read<LocationViewModel>().latLng;
      if (latLng != null) {
        cameraPosition = CameraPosition(target: latLng);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cameraPosition != null
          ? GoogleMap(initialCameraPosition: cameraPosition!)
          : const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
    );
  }
}
