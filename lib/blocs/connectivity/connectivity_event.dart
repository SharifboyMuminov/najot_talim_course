
import 'package:equatable/equatable.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();
}

class CheckConnectivity extends ConnectivityEvent {
  @override
  List<Object?> get props => [];
}

class InitialCheckConnectivity extends ConnectivityEvent {
  @override
  List<Object?> get props => [];
}