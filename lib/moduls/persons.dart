class Person {
  String fullname;
  String text;
  bool isRemove;

  Person({required this.fullname, required this.text, required this.isRemove});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
        fullname: json["name"] as String? ?? "Null",
        text: json["text"] as String? ?? "Null",
        isRemove: json["is_remove"] as bool? ?? false);
  }
}
