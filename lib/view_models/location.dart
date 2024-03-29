// import 'package:flutter/foundation.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// class LocationViewModel extends ChangeNotifier {
//   Location location = Location();
//
//   LatLng? latLng;
//
//   LocationViewModel() {
//     getUserLocation();
//   }
//
//   Future<void> getUserLocation() async {
//     bool serviceEnabled = false;
//     late PermissionStatus permissionGranted;
//     late LocationData locationData;
//
//     serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//       if (!serviceEnabled) {
//         return;
//       }
//     }
//
//     permissionGranted = await location.hasPermission();
//     if (permissionGranted == PermissionStatus.denied) {
//       permissionGranted = await location.requestPermission();
//       if (permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }
//
//     locationData = await location.getLocation();
//     latLng = LatLng(locationData.latitude!, locationData.longitude!);
//
//
//
//   }
//
//
// }