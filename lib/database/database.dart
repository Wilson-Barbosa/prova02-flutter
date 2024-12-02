import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:wilson_diego_barbosa_p2/model/user_model.dart';

class DatabaseHelper {
  // Singleton pattern
  static final DatabaseHelper instance = DatabaseHelper.internal();
  Database? _database;

  factory DatabaseHelper() {
    return instance;
  }

  DatabaseHelper.internal();

  // Getter for the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT NOT NULL UNIQUE,
            password TEXT NOT NULL
          )
          ''',
        );
      },
    );
  }


  Future<int> insertNewUser(UserModel user) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert(
      'users', // Table name
      {
        'name': user.name,
        'email': user.email,
        'password': user.password,
      }, 
      conflictAlgorithm: ConflictAlgorithm.replace, // Avoid duplicates
    ); 
  }


  Future<List<UserModel>> getAllUsersFromDatabase() async {
    final db = await database;
    final List<Map<String, dynamic>> userMaps = await db.query('users');

    return userMaps.map((userMap) {
      return UserModel(
        name: userMap['name'],
        email: userMap['email'],
        password: userMap['password'],
      );
    }).toList();
  }

  Future<UserModel?> getUserByEmail(String email) async {
  final db = await database;
  final List<Map<String, dynamic>> result = await db.query(
    'users', 
    where: 'email = ?', 
    whereArgs: [email],
    limit: 1, 
  );

  if (result.isNotEmpty) {
    
    return UserModel(
      name: result.first['name'],
      email: result.first['email'],
      password: result.first['password'],
    );
  } else {
    return null;
  }
}

}
