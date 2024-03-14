class StateNameModel {
  final String nameState;
  StateNameModel({required this.nameState});

  factory StateNameModel.fomJson(Map<String, dynamic> json) {
    return StateNameModel(
        nameState: json["official"] as String? ?? "Kemadiyu :)");
  }
}

// "name": {
// "common": "Cyprus",
// "official": "Republic of Cyprus",
// },