import 'package:default_project/moduls/persons.dart';

class Burning {
  String burning;
  List<Person> people;

  Burning({
    required this.burning,
    required this.people,
  });

  factory Burning.fromJson(Map<String, dynamic> json) {
    return Burning(
      burning: json["burning_name"] as String? ?? "Null",
      people:
          (json["people"] as List?)?.map((e) => Person.fromJson(e)).toList() ??
              [],
    );
  }
}
