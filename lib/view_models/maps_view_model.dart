import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsViewModel extends ChangeNotifier {
  final Completer<GoogleMapController> googleController =
      Completer<GoogleMapController>();

  CameraPosition? cameraPosition;
  MapType mapType = MapType.normal;

  init(LatLng latLng) async {
    cameraPosition = CameraPosition(
      target: latLng,
      zoom: 15,
    );
    notifyListeners();
  }

  Future<void> oToTheLake() async {
    final GoogleMapController controller = await googleController.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition!));
    notifyListeners();
  }

  startPosition(MapType newMapType) {
    mapType = newMapType;
    notifyListeners();
  }
}
