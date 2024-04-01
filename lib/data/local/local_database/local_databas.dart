import 'package:default_project/data/moduls/note.dart';
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

    await db.execute('''CREATE TABLE ${PersonContans.tableName} (
      ${PersonContans.id} $idType,
      ${PersonContans.date} $textType,
      ${PersonContans.creatDate} $textType,
      ${PersonContans.descreption} $textType,
      ${PersonContans.name} $textType
    )''');
  }

  static Future<NoteModel> insertDebtors(NoteModel personModul) async {
    final db = await databaseInstance.database;

    int savedTaskID =
        await db.insert(PersonContans.tableName, personModul.toJson());

    return personModul.copyWith(id: savedTaskID);
  }

  static Future<List<NoteModel>> getAllDebtors() async {
    final db = await databaseInstance.database;
    String orderBy = "${PersonContans.id} DESC";
    List json = await db.query(PersonContans.tableName, orderBy: orderBy);
    return json.map((e) => NoteModel.fromJson(e)).toList();
  }

  static Future<int> deleteDebtors(int id) async {
    final db = await databaseInstance.database;
    int deletedId = await db.delete(
      PersonContans.tableName,
      where: "${PersonContans.id} = ?",
      whereArgs: [id],
    );
    return deletedId;
  }

  static updateNote({required NoteModel noteModel}) async {
    final db = await databaseInstance.database;
    // debugPrint(noteModel.id.toString());

    await db.update(PersonContans.tableName, noteModel.toJsonForUpdate(),
        where: "${PersonContans.id} = ?", whereArgs: [noteModel.id]);
  }
}
