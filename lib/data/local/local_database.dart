import 'package:default_project/data/models/history/history_model.dart';
import 'package:default_project/data/models/network_response.dart';
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

    await db.execute('''CREATE TABLE SearchHistory (
      id $idType,
      title $textType
    )''');
  }

  static Future<NetworkResponse> insertHistory(
      {required HistoryModel historyModel}) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      final db = await databaseInstance.database;

      int savedTaskID = await db.insert("SearchHistory", historyModel.toJson());

      networkResponse.data = historyModel.copyWith(id: savedTaskID);
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  static Future<NetworkResponse> getAllHistory() async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      final db = await databaseInstance.database;
      String orderBy = "id DESC";
      List json = await db.query("SearchHistory", orderBy: orderBy);
      networkResponse.data = json.map((e) => HistoryModel.fromJson(e)).toList();
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  static Future<NetworkResponse> deleteHistory(int id) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      final db = await databaseInstance.database;
      networkResponse.data = await db.delete(
        "SearchHistory",
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }
}
