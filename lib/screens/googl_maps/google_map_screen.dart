import 'package:default_project/screens/googl_maps/widget/set_type_google.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../view_models/maps_view_model.dart';

class GoogleMapsScreen extends StatelessWidget {
  const GoogleMapsScreen({super.key, required this.latLng});

  final LatLng latLng;

  @override
  Widget build(BuildContext context) {
    var mapsViewModel = Provider.of<MapsViewModel>(context, listen: false);
    mapsViewModel.init(latLng);

    return Scaffold(
      body: Consumer<MapsViewModel>(
        builder:
            (BuildContext context, MapsViewModel mapsViewModel, Widget? child) {
          if (mapsViewModel.cameraPosition == null) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return Stack(
            children: [
              GoogleMap(

                mapType: mapsViewModel.mapType,
                initialCameraPosition: mapsViewModel.cameraPosition!,
                onMapCreated: (v) {
                  mapsViewModel.googleController.complete(v);
                },
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/location.png",
                  width: 50,
                  height: 50,
                ),
              ),
              const SetTypeGoogleShow(),
            ],
          );
        },
      ),
    );
  }
}
