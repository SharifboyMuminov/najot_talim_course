import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../data/api_provider/api_provider.dart';

class GetLocationText extends ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  String textLocation = "";

  Future<void> getLocationText({required LatLng latLng}) async {
    _notify(true);
    textLocation = await ApiProvider.getPlaceNameByLocation(latLng);
    _notify(false);
  }

  _notify(bool v) {
    _loading = v;
    notifyListeners();
  }
}
