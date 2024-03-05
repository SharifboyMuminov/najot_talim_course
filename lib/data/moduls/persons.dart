class PersonModul {
  int? id;
  String fullname;
  String text;
  String date;
  String createDate;
  bool isRemove;

  PersonModul(
      {required this.date,
      required this.fullname,
      required this.text,
      required this.createDate,
      this.isRemove = false,
      this.id});

  factory PersonModul.fromJson(Map<String, dynamic> json) {
    return PersonModul(
      id: json[PersonContans.id],
      fullname: json[PersonContans.name] as String? ?? "Null",
      text: json[PersonContans.descreption] as String? ?? "Null",
      date: json[PersonContans.date] as String? ?? "",
      createDate: json[PersonContans.creatDate] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      PersonContans.creatDate: createDate.toString(),
      PersonContans.date: date.toString(),
      PersonContans.descreption: deprecated.toString(),
      PersonContans.name: fullname.toString(),
    };
  }

  static PersonModul defoultModul() {
    return PersonModul(date: "asd", fullname: "das", text: "asd", createDate: "dsd");
  }

  PersonModul copyWith(
      {String? date,
      String? fullName,
      int? id,
      String? createDate,
      String? descreption}) {
    return PersonModul(
        date: date ?? this.date,
        fullname: fullName ?? this.fullname,
        text: descreption ?? this.text,
        createDate: createDate ?? this.createDate);
  }
}

class PersonContans {
  static const tableName1 = "Qarzlarim";
  static const tableName2 = "Qarzdorlar";
  static const name = "name";
  static const creatDate = "creat_date";
  static const descreption = "descreption";
  static const date = "date";
  static const id = "id";
}
