import 'package:default_project/data/models/task/task_modul.dart';
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
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''CREATE TABLE ${TaskContans.tableName} (
      ${TaskContans.id} $idType,
      ${TaskContans.title} $textType,
      ${TaskContans.decreption} $textType,
      ${TaskContans.day} $textType,
      ${TaskContans.hour} $textType,
      ${TaskContans.status} $textType,
      ${TaskContans.category} $textType,
      ${TaskContans.priority} $intType
    )''');
  }

  static Future<TaskModul> insertTask(TaskModul taskModel) async {
    debugPrint("INITIAL ID:${taskModel.id}");
    final db = await databaseInstance.database;
    int savedTaskID =
        await db.insert(TaskContans.tableName, taskModel.toJson());
    debugPrint("SAVED ID:$savedTaskID");
    return taskModel.copyWith(id: savedTaskID);
  }

  static Future<List<TaskModul>> getAllTasks() async {
    final db = await databaseInstance.database;
    String orderBy = "${TaskContans.id} DESC";
    List json = await db.query(TaskContans.tableName, orderBy: orderBy);
    return json.map((e) => TaskModul.fomJson(e)).toList();
  }
}
