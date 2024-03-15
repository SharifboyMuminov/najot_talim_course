import 'package:default_project/data/models/state/state_flag_model.dart';
import 'package:default_project/data/models/state/state_gerb_model.dart';
import 'state_name_model.dart';

class StateModel {
  final StateFlagModel stateFlagModel;
  final StateGerbModel stateGerbModel;
  final String region;
  final StateNameModel stateNameModel;

  StateModel({
    required this.stateNameModel,
    required this.region,
    required this.stateFlagModel,
    required this.stateGerbModel,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      stateFlagModel: StateFlagModel.fromJson(json["flags"]),
      stateGerbModel: StateGerbModel.fromJson(json["coatOfArms"]),
      region: json['region'] as String? ?? "Uzbekistan :)",
      stateNameModel: StateNameModel.fomJson(json["name"]),
    );
  }
}
