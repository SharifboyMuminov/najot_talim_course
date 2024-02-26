import 'package:translator/translator.dart';

class TransLation {
  static final translator = GoogleTranslator();

  static Future<String> getTranslation(
      String input, String from, String to) async {
    var translation = await translator.translate(input, from: from, to: to);
    return translation.text as String? ?? "";
  }
}
