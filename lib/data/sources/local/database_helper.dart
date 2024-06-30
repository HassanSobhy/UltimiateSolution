import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'orders_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE orders (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        billAmount TEXT,
        billDate TEXT,
        billNumber TEXT,
        billSerial TEXT,
        billTime TEXT,
        billType TEXT,
        customerAddress TEXT,
        customerApartmentNumber TEXT,
        customerBuildingNumber TEXT,
        customerFloorNumber TEXT,
        customerName TEXT,
        deliveryAmount TEXT,
        deliveryStatusFlag TEXT,
        latitude TEXT,
        longitude TEXT,
        mobileNumber TEXT,
        regionName TEXT,
        taxAmount TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE status_types (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        number TEXT
      )
    ''');
  }
}
