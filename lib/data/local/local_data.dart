import 'package:default_project/data/models/place.dart';
import 'package:default_project/utils/app_constans.dart';
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
    const textType = "TEXT";

    await db.execute('''CREATE TABLE ${AppCon.placeTable} (
     ${AppCon.id} $idType,
     ${AppCon.title} $textType,
     ${AppCon.category} $textType,
     ${AppCon.lat} $textType,
     ${AppCon.long} $textType,
     ${AppCon.imagePth} $textType
    )''');
  }

  static Future<PlaceModel> insertDebtors(PlaceModel placeModel) async {
    final db = await databaseInstance.database;

    int savedTaskID = await db.insert(AppCon.placeTable, placeModel.toJson());

    return placeModel.copyWith(id: "savedTaskID");
  }

  static Future<List<PlaceModel>> getAllDebtors() async {
    final db = await databaseInstance.database;
    String orderBy = "${AppCon.id} DESC";
    List json = await db.query(AppCon.placeTable, orderBy: orderBy);
    return json.map((e) => PlaceModel.fromJson(e)).toList();
  }
  static Future<int> deleteDebtors(int id) async {
    final db = await databaseInstance.database;
    int deletedId = await db.delete(
      AppCon.placeTable,
      where: "${AppCon.id} = ?",
      whereArgs: [id],
    );
    return deletedId;
  }
}
