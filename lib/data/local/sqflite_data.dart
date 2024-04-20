import 'package:default_project/data/models/network_response.dart';
import 'package:default_project/data/models/qr/qr_scanner_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static final databaseInstance = LocalDatabase._();

  LocalDatabase._();

  factory LocalDatabase() {
    return databaseInstance;
  }

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _init("todo.db");
      return _database!;
    }
  }

  Future<Database> _init(String databaseName) async {
    String internalPath = await getDatabasesPath();
    String path = join(internalPath, databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";

    await db.execute('''CREATE TABLE QrData (
      id $idType,
      name $textType,
      date $textType,
      qr_code $textType
    )''');
  }

  static Future<NetworkResponse> insertQrScannerModel(
      QrScannerModel qrScannerModel) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      final db = await databaseInstance.database;

      await db.insert("QrData", qrScannerModel.toJson());
    } catch (_) {
      debugPrint(_.toString());
      networkResponse.errorText = "Hato insertda :(";
    }

    return networkResponse;
  }

  static Future<NetworkResponse> getAllQrScannerModels() async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      final db = await databaseInstance.database;
      String orderBy = "id DESC";
      List json = await db.query("QrData", orderBy: orderBy);
      networkResponse.data =
          json.map((e) => QrScannerModel.fromJson(e)).toList();
    } catch (_) {
      networkResponse.errorText = "Error Call Metod :(";
    }
    return networkResponse;
  }

  static Future<NetworkResponse> deleteQrScannerModel(int id) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      final db = await databaseInstance.database;
      await db.delete(
        "QrData",
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (_) {
      networkResponse.errorText = "Error Delete :(";
    }
    return networkResponse;
  }
}
