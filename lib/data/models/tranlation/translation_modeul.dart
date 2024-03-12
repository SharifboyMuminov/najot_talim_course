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
    String storage = fromLanguchar;
    fromLanguchar = toLanguage;
    toLanguage = storage;

    storage = from;
    from = to;
    to = storage;

    storage = hintTextFrom;
    hintTextFrom = hintTextTo;
    hintTextTo = storage;
  }

  void setRu() {
    toLanguage = "Russia";
    to = "ru";
    hintTextTo = "Напишите здес...";
  }

  void setEng() {
    toLanguage = "English";
    to = 'en';
    hintTextTo = 'You write here...';
  }

  void setFranc() {
    toLanguage = "English";
    to = 'fr';
    hintTextTo = 'écris dans cet espace';
  }

  void setTurk() {
    toLanguage = "English";
    to = 'tr';
    hintTextTo = 'Bu alana yaz';
  }
}
