import 'package:default_project/data/models/favorite/favorite_model.dart';
import 'package:default_project/data/models/network_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final databaseInstance = LocalDatabase._();

  LocalDatabase._();

  factory LocalDatabase() {
    return databaseInstance;
  }

  Database? _database;

  Future<Database> get database async {
    debugPrint("Hello :)");
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
    await db.execute('''CREATE TABLE FavoriteMusics (
      _id INTEGER DEFAULT 0
    )''');
  }

  static Future<NetworkResponse> getAllFavorites() async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      final db = await databaseInstance.database;
      String orderBy = "_id DESC";
      List json = await db.query("FavoriteMusics", orderBy: orderBy);
      networkResponse.data =
          json.map((e) => FavoriteModel.fromJson(e)).toList();
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  static Future<NetworkResponse> insertFavorite(
      FavoriteModel favoriteModel) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      final db = await databaseInstance.database;

      int savedTaskID =
          await db.insert("FavoriteMusics", favoriteModel.toJson());

      networkResponse.data = favoriteModel.copyWith(id: savedTaskID);
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  static Future<NetworkResponse> deleteFavorite(int id) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      final db = await databaseInstance.database;
      networkResponse.data = await db.delete(
        "FavoriteMusics",
        where: "_id = ?",
        whereArgs: [id],
      );
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }
}
