import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  static final StorageRepository instance = StorageRepository._();
  static SharedPreferences? _preference;

  StorageRepository._();

  factory StorageRepository() => instance;

  static Future<void> init() async {
    _preference = await SharedPreferences.getInstance();
  }

  static Future<void> setInt({
    required String key,
    required int value,
  }) async {
    if (_preference != null) {
      debugPrint("SAVING INT:$value");
      _preference!.setInt(key, value);
    }
  }

  static int getInt({required String key}) {
    if (_preference != null) {
      return _preference!.getInt(key) ?? 0;
    }
    return 0;
  }

  static Future<void> setString({
    required String key,
    required String value,
  }) async {
    if (_preference != null) {
      debugPrint("SAVING STRING:$value");
      _preference!.setString(key, value);
    }
  }

  static String getString({required String key}) {
    if (_preference != null) {
      return _preference!.getString(key) ?? "";
    }
    return "";
  }

  static Future<void> setBool({
    required String key,
    required bool value,
  }) async {
    if (_preference != null) {
      debugPrint("SAVING BOOL:$value");
      _preference!.setBool(key, value);
    }
  }

  static bool getBool({required String key}) {
    if (_preference != null) {
      return _preference!.getBool(key) ?? false;
    }
    return false;
  }

  static Future<void> setDouble({
    required String key,
    required double value,
  }) async {
    if (_preference != null) {
      debugPrint("SAVING DOUBLE:$value");
      _preference!.setDouble(key, value);
    }
  }

  static double getDouble({required String key}) {
    if (_preference != null) {
      return _preference!.getDouble(key) ?? 0.0;
    }
    return 0.0;
  }

  static Future<void> setListString({
    required String key,
    required List<String> values,
  }) async {
    if (_preference != null) {
      debugPrint("SAVING LIST:$values");
      _preference!.setStringList(key, values);
    }
  }

  static List<String> getStringList({required String key}) {
    if (_preference != null) {
      return _preference!.getStringList(key) ?? [];
    }
    return [];
  }
}