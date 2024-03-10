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

    await db.execute('''CREATE TABLE Favorite (
      _id: $idType,
      api_id $intType
    )''');

    await db.execute('''CREATE TABLE Favorite (
      _id: $idType,
      api_id $intType
    )''');

    // await db.execute('''CREATE TABLE ${PersonContans.tableName2} (
    //   ${PersonContans.id} $idType,
    //   ${PersonContans.date} $textType,
    //   ${PersonContans.creatDate} $textType,
    //   ${PersonContans.descreption} $textType,
    //   ${PersonContans.name} $textType
    // )''');
  }
}
