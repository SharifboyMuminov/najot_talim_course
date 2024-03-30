import 'dart:async';

import 'dart:ui' as ui;
import 'package:default_project/data/models/place.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapsViewModel extends ChangeNotifier {
  final Completer<GoogleMapController> googleController =
      Completer<GoogleMapController>();

  CameraPosition? cameraPosition;
  late CameraPosition currentCameraPosition;
  MapType mapType = MapType.normal;
  Set<Marker> markers = {};
  LatLng? latLng;

  init() async {
    if (latLng != null) {
      cameraPosition = CameraPosition(
        target: latLng!,
        zoom: 15,
      );
    }

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

  newCurrentPosition(
      {required PlaceModel placeModel,
      required CameraPosition cameraPosition}) async {
    Uint8List markerImage = await getBytesFromAsset(
      placeModel.imagePath,
      100,
    );
    markers.add(
      Marker(
        position: cameraPosition.target,
        infoWindow:
            InfoWindow(title: placeModel.title, snippet: placeModel.category),
        icon: BitmapDescriptor.fromBytes(markerImage),
        markerId: MarkerId(DateTime.now().toString()),
      ),
    );
    notifyListeners();
  }

  useFireBaseMark({required List<PlaceModel> placeModels}) async {
    debugPrint("useSqliMark ga keldi :)");
    for (int i = 0; i < placeModels.length; i++) {
      debugPrint("Qonday");
      Uint8List markerImage = await getBytesFromAsset(
        placeModels[i].imagePath,
        100,
      );
      markers.add(
        Marker(
          position: placeModels[i].latLng,
          infoWindow: InfoWindow(
              title: placeModels[i].title, snippet: placeModels[i].category),
          icon: BitmapDescriptor.fromBytes(markerImage),
          markerId: MarkerId(i.toString()),
        ),
      );
      notifyListeners();

    }
    debugPrint("Lengthe Markers:  ${markers.length}");

  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Location location = Location();

  Future<void> getUserLocation() async {
    bool serviceEnabled = false;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    latLng = LatLng(locationData.latitude!, locationData.longitude!);
    init();
  }

  Future<Set<Marker>> getMarker({required PlaceModel placeModel}) async {
    Uint8List markerImage = await getBytesFromAsset(
      placeModel.imagePath,
      100,
    );
    LatLng myLatLong = placeModel.latLng;

    return {
      Marker(
        position: myLatLong,
        infoWindow:
            InfoWindow(title: placeModel.title, snippet: placeModel.category),
        icon: BitmapDescriptor.fromBytes(markerImage),
        markerId: MarkerId(DateTime.now().toString()),
      ),
    };
  }

  void removeMarket({required PlaceModel placeModel}) {
    markers.removeWhere((element) => element.position == placeModel.latLng);
    notifyListeners();
  }
}
