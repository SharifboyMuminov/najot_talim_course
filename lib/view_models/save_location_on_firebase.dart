import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/data/models/place.dart';
import 'package:default_project/utils/app_constans.dart';
import 'package:flutter/cupertino.dart';

import 'maps_view_model.dart';

class SaveLocationOnFireBase extends ChangeNotifier {
  List<PlaceModel> placeModels = [];
  MapsViewModel mapsView = MapsViewModel();

  Future<void> callLocation() async {
    try {
      _notefication(true);
      await FirebaseFirestore.instance
          .collection(AppCon.placeTable)
          .get()
          .then((value) {
        placeModels =
            value.docs.map((e) => PlaceModel.fromJson(e.data())).toList();
      });
      mapsView.useFireBaseMark(placeModels: placeModels);

      _notefication(false);
    } on FirebaseException catch (err) {
      _notefication(false);

      debugPrint("My Error callLocation FirebaseException $err");
    } catch (err) {
      _notefication(false);

      debugPrint("My Error callLocation $err");
    }
  }

  Future<void> insertLocation({required PlaceModel placeModel}) async {
    try {
      _notefication(true);

      var cf = await FirebaseFirestore.instance
          .collection(AppCon.placeTable)
          .add(placeModel.toJson());

      await FirebaseFirestore.instance
          .collection(AppCon.placeTable)
          .doc(cf.id)
          .update({"doc_id": cf.id});
      callLocation();

      _notefication(false);
    } on FirebaseException catch (err) {
      _notefication(false);

      debugPrint("My Error insertLocation FirebaseException $err");
    } catch (err) {
      _notefication(false);

      debugPrint("My Error insertLocation $err");
    }
  }

  Future<void> deleteLocation({required PlaceModel placeModel}) async {
    try {
      _notefication(true);
      await FirebaseFirestore.instance
          .collection(AppCon.placeTable)
          .doc(placeModel.id)
          .delete();
      mapsView.removeMarket(placeModel: placeModel);
      callLocation();
      _notefication(false);
    } on FirebaseException catch (err) {
      _notefication(false);

      debugPrint("My Error deleteLocation FirebaseException $err");
    } catch (err) {
      _notefication(false);

      debugPrint("My Error deleteLocation $err");
    }
  }

  bool _loading = false;

  bool get loading => _loading;

  _notefication(bool v) {
    _loading = v;
    notifyListeners();
  }
}
