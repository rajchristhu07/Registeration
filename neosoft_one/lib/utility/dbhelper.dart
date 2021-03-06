import 'dart:async';
import 'dart:io' as io;
import 'package:neosoftflutter/model/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "user_tbl.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE USER(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT, mobileno TEXT,emailId TEXT,password TEXT,gender TEXT,  picture TEXT,  address TEXT,  landmark TEXT,  city TEXT,  state TEXT,  pincode TEXT)");
  }

  Future<User> saveUser(User user) async {
    var dbClient = await db;
    await dbClient.insert("USER", user.toMap());
    return user;

  }

  Future<List<User>> getUser() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM USER');
    List<User> user =  [];
    for (int i = 0; i < list.length; i++) {
      user.add(User(list[i]["firstname"], list[i]["lastname"], list[i]["mobileno"], list[i]["emailId"],list[i]["password"],list[i]["gender"], list[i]["picture"], list[i]["address"], list[i]["landmark"], list[i]["city"], list[i]["state"], list[i]["pincode"]));
    }
    return user;
  }
}