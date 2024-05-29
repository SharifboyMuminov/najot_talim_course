import 'package:equatable/equatable.dart';

abstract class RegionEvent extends Equatable {}

class RegionCallEvent extends RegionEvent {
  @override
  List<Object?> get props => [];
}
