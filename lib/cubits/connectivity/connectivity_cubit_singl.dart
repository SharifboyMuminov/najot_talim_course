import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityCubitSing extends Cubit<bool> {
  ConnectivityCubitSing() : super(false);

  final Connectivity _connectivity = Connectivity();

  Future<void> _checkInitialState() async {
    List<ConnectivityResult> results = await _connectivity.checkConnectivity();

    if (results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi)) {
      emit(true);
    } else {
      emit(false);
    }
  }

  getConnectivity() async {
    return Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) async {
      List<ConnectivityResult> results =
          await _connectivity.checkConnectivity();

      if (results.contains(ConnectivityResult.mobile) ||
          results.contains(ConnectivityResult.wifi)) {
        emit(true);
      } else {
        emit(false);
      }
    });
  }
}
