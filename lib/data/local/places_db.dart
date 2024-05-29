import 'package:default_project/data/models/network_response.dart';
import 'package:default_project/data/models/region/region_model.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PlacesDatabase {
  static final PlacesDatabase instance = PlacesDatabase._init();

  PlacesDatabase._init();

  factory PlacesDatabase() {
    return instance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await createAndInitializeDatabase();
      return _database!;
    }
  }

  Future<Database> createAndInitializeDatabase() async {
    final databasePath = await getDatabasesPath();
    final databaseFilePath = join(databasePath, 'my_database.db');

    final database = await openDatabase(databaseFilePath, version: 1,
        onCreate: (Database db, int version) async {
      // Read and execute SQL script here
      final scriptContent =
          await rootBundle.loadString('assets/places/regions.sql');
      final statements = scriptContent.split(';');

      for (final statement in statements) {
        if (statement.trim().isNotEmpty) {
          await db.execute(statement);
        }
      }
    });

    return database; // Return the created database
  }

  Future<List<Map<String, dynamic>>> executeQuery(String query) async {
    final db = await instance.database;
    return await db.rawQuery(query);
  }

  Future<NetworkResponse> getAllRegions() async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      final db = await instance.database;
      networkResponse.data = (await db.query('regions'))
          .map((e) => RegionModel.fromJson(e))
          .toList();
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  // Future<List<RegionModel>> getRegionById({required int id}) async {
  //   List<RegionModel> regionsById = [];
  //   final db = await instance.database;
  //   regionsById =
  //       (await db.query('regions', where: 'id LIKE ?', whereArgs: ['%$id']))
  //           .map((e) => RegionModel.fromJson(e))
  //           .toList();
  //   return regionsById;
  // }

  Future<NetworkResponse> getAllDistricts() async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      final db = await instance.database;
      networkResponse.data = (await db.query('districts'))
          .map((e) => RegionModel.fromJson(e))
          .toList();
    } catch (error) {
      networkResponse.errorText = error.toString();
    }
    return networkResponse;
  }

  Future<NetworkResponse> getAllQuarters() async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      final db = await instance.database;
      networkResponse.data = (await db.query('quarters'))
          .map((e) => RegionModel.fromJson(e))
          .toList();
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }
}
