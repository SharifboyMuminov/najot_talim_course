import 'package:default_project/data/moduls/notes/note.dart';
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

    await db.execute('''CREATE TABLE ${NotesConstanse.tableName} (
      ${NotesConstanse.id} $idType,
      ${NotesConstanse.date} $textType,
      ${NotesConstanse.creatDate} $textType,
      ${NotesConstanse.descreption} $textType,
      ${NotesConstanse.name} $textType
    )''');
  }

  static Future<NoteModel> insertNotes(NoteModel personModel) async {
    final db = await databaseInstance.database;

    int savedTaskID =
        await db.insert(NotesConstanse.tableName, personModel.toJson());

    return personModel.copyWith(id: savedTaskID);
  }

  static Future<List<NoteModel>> getAllNotes() async {
    final db = await databaseInstance.database;
    String orderBy = "${NotesConstanse.id} DESC";
    List json = await db.query(NotesConstanse.tableName, orderBy: orderBy);
    return json.map((e) => NoteModel.fromJson(e)).toList();
  }

  static Future<int> deleteNotes(NoteModel noteModel) async {
    final db = await databaseInstance.database;
    int deletedId = await db.delete(
      NotesConstanse.tableName,
      where: "${NotesConstanse.id} = ?",
      whereArgs: [noteModel.id],
    );
    return deletedId;
  }

  static Future<int> updateNotes({required NoteModel noteModel}) async {
    final db = await databaseInstance.database;
    // debugPrint(noteModel.id.toString());

    int a = await db.update(
        NotesConstanse.tableName, noteModel.toJsonForUpdate(),
        where: "${NotesConstanse.id} = ?", whereArgs: [noteModel.id]);

    return a;
  }

  static Future<List<NoteModel>> searchNotes(String query) async {
    final db = await databaseInstance.database;

    var json = await db.query(NotesConstanse.tableName,
        where: "${NotesConstanse.name} LIKE ?", whereArgs: ["$query%"]);

    return json.map((e) => NoteModel.fromJson(e)).toList();
  }
}
