class LangucheModel {
  String toLanguage;
  String fromLanguchar;
  String to;
  String from;
  String hintTextFrom;
  String hintTextTo;

  LangucheModel(
      {required this.fromLanguchar,
      required this.toLanguage,
      required this.from,
      required this.to,
      required this.hintTextFrom,
      required this.hintTextTo});

  void changeLAngucher() {
    String storage = this.fromLanguchar;
    this.fromLanguchar = this.toLanguage;
    this.toLanguage = storage;

    storage = this.from;
    this.from = this.to;
    this.to = storage;

    storage = this.hintTextFrom;
    this.hintTextFrom = this.hintTextTo;
    this.hintTextTo = storage;
  }
}
