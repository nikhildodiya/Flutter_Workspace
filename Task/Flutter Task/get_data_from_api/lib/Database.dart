import 'package:get_data_from_api/Model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB
{
  Future<Database> initDB() async
  {
    String path = await getDatabasesPath();
    return openDatabase(join(path,"MYDatabase.db"),onCreate: (database,version)async
    {
      await database.execute('CREATE TABLE Download(id INTEGER PRIMARY KEY AUTOINCREMENT,url TEXT NOT NULL)');
    },version: 1);
  }
}