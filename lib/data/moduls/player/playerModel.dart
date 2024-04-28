class PlayerModel {
  int id;
  String firstName;
  int number;
  int speed;
  int penalty;
  int strike;
  int reaction;
  int control;
  int physically;
  int tall;

  PlayerModel({
    required this.id,
    required this.firstName,
    required this.number,
    required this.speed,
    required this.penalty,
    required this.strike,
    required this.reaction,
    required this.control,
    required this.physically,
    required this.tall,
  });

  // toJson method to convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "first_name": firstName,
      "number": number,
      "speed": speed,
      "penalty": penalty,
      "strike": strike,
      "reaction": reaction,
      "control": control,
      "physically": physically,
      "tall": tall,
    };
  }

  // fromJson method to convert JSON to object
  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      id: json["id"] as int? ?? 0,
      firstName: json["first_name"] as String? ?? "",
      number: json["number"] as int? ?? 0,
      speed: json["speed"] as int? ?? 0,
      penalty: json["penalty"] as int? ?? 0,
      strike: json["strike"] as int? ?? 0,
      reaction: json["reaction"] as int? ?? 0,
      control: json["control"] as int? ?? 0,
      physically: json["physically"] as int? ?? 0,
      tall: json["tall"] as int? ?? 0,
    );
  }
}
