import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/models/todo_model.dart';

class DbHelper {
  static DbHelper? instance;
  DbHelper._();
  factory DbHelper() => instance ??= DbHelper._();

  static const String dbName = 'todo_database.db';

  static Future<Database> getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), dbName),
      onCreate: (db, version) {
        return db.execute(TodoModel.createTable);
      },
      version: 1,
    );
  }
}
