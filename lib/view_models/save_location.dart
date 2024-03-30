// import 'package:default_project/data/models/place.dart';
// import 'package:flutter/cupertino.dart';
//
// import '../data/local/local_data.dart';
//
// class SaveLocation extends ChangeNotifier {
//   List<PlaceModel> placeModels = [];
//
//   Future<void> getAllLocation() async {
//     placeModels = await LocalDatabase.getAllDebtors();
//     notifyListeners();
//   }
//
//   Future<void> insertLocation(PlaceModel placeModel) async {
//     PlaceModel placeMod = await LocalDatabase.insertDebtors(placeModel);
//     placeModels.add(placeMod);
//     notifyListeners();
//   }
//
//   Future<List<PlaceModel>> getSaveLocation() async {
//     return await LocalDatabase.getAllDebtors();
//   }
//
//   Future<void> deleteLocation({required PlaceModel placeModel}) async {
//     if (placeModel.id != null) {
//       debugPrint("Delete sql");
//       placeModels.remove(placeModel);
//       // await LocalDatabase.deleteDebtors(placeModel.id);
//       notifyListeners();
//     }
//   }
// }
