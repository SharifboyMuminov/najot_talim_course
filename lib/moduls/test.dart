import 'package:default_project/moduls/level_enum.dart';

getLevel(String level) {
  switch (level) {
    case "medium":
      return Level.medium;
    case "easiy":
      return Level.easy;
    default:
      return Level.hard;
  }
}
