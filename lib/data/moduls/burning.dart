import 'package:default_project/data/moduls/persons.dart';

class Burning {
  String burning;
  List<PersonModul> people;

  Burning({
    required this.burning,
    required this.people,
  });

  factory Burning.fromJson(Map<String, dynamic> json) {
    return Burning(
      burning: json["burning_name"] as String? ?? "Null",
      people: (json["people"] as List?)
              ?.map((e) => PersonModul.fromJson(e))
              .toList() ??
          [],
    );
  }
}
