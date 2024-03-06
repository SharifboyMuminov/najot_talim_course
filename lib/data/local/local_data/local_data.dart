import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../models/coffe_modul/coffe_modul.dart';

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

    await db.execute('''CREATE TABLE ${CoffeModulContans.tableFavorite} (
      ${CoffeModulContans.id} $idType,
      ${CoffeModulContans.cagetegoriyModul} $intType,
      ${CoffeModulContans.descreption} $textType,
      ${CoffeModulContans.name} $textType,
      ${CoffeModulContans.subTitle} $textType,
      ${CoffeModulContans.imageUr} $textType,
      ${CoffeModulContans.price} $int,
      ${CoffeModulContans.isFavorite} $textType
    )''');
  }

  static Future<void> insertFavoriteCoffe(CoffeModul coffeModul) async {
    final db = await databaseInstance.database;
    await db.insert(
        CoffeModulContans.tableFavorite, coffeModul.toJsonFavorute());
  }

  static Future<List<CoffeModul>> getAllFavoriteCoffe() async {
    final db = await databaseInstance.database;
    String orderBy = "${CoffeModulContans.id} DESC";
    List json =
        await db.query(CoffeModulContans.tableFavorite, orderBy: orderBy);
    return json.map((e) => CoffeModul.fromJson(e)).toList();
  }

  static Future<int> deleteFavoriteCoffe(int id) async {
    final db = await databaseInstance.database;
    int deletedId = await db.delete(
      CoffeModulContans.tableFavorite,
      where: "${CoffeModulContans.id} = ?",
      whereArgs: [id],
    );
    return deletedId;
  }
}
