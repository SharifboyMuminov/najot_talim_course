import 'package:default_project/data/moduls/persons.dart';
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

    await db.execute('''CREATE TABLE ${PersonContans.tableName1} (
      ${PersonContans.id} $idType,
      ${PersonContans.date} $textType,
      ${PersonContans.creatDate} $textType,
      ${PersonContans.descreption} $textType,
      ${PersonContans.name} $textType
    )''');

    await db.execute('''CREATE TABLE ${PersonContans.tableName2} (
      ${PersonContans.id} $idType,
      ${PersonContans.date} $textType,
      ${PersonContans.creatDate} $textType,
      ${PersonContans.descreption} $textType,
      ${PersonContans.name} $textType
    )''');
  }

  static Future<PersonModul> insertDebtors(PersonModul personModul) async {
    final db = await databaseInstance.database;

    int savedTaskID =
        await db.insert(PersonContans.tableName1, personModul.toJson());

    return personModul.copyWith(id: savedTaskID);
  }

  static Future<PersonModul> insertMyDebts(PersonModul personModul) async {
    final db = await databaseInstance.database;
    int savedTaskID =
        await db.insert(PersonContans.tableName2, personModul.toJson());
    return personModul.copyWith(id: savedTaskID);
  }

  static Future<List<PersonModul>> getAllDebtors() async {
    final db = await databaseInstance.database;
    String orderBy = "${PersonContans.id} DESC";
    List json = await db.query(PersonContans.tableName1, orderBy: orderBy);
    return json.map((e) => PersonModul.fromJson(e)).toList();
  }

  static Future<List<PersonModul>> getAllMyDebtors() async {
    final db = await databaseInstance.database;
    String orderBy = "${PersonContans.id} DESC";
    List json = await db.query(PersonContans.tableName2, orderBy: orderBy);
    return json.map((e) => PersonModul.fromJson(e)).toList();
  }

   static Future<int> deleteDebtors(int id) async {
    final db = await databaseInstance.database;
    int deletedId = await db.delete(
      PersonContans.tableName1,
      where: "${PersonContans.id} = ?",
      whereArgs: [id],
    );
    return deletedId;
  }
}
