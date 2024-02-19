import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDb
{

  late Database db;

  Future open() async
  {

    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'task.db');
    print(path);
    db = await openDatabase(path,version: 1,onCreate:(Database db, int version) async
    {

      await db.execute('''

                    CREATE TABLE IF NOT EXISTS registration
                    ( 
                          id primary key,
                          first_name varchar(255) not null,
                          last_name varchar(255) not null,
                          mobile int,
                          email varchar(255) not null,
                          hobbies varchar(255) not null,
                          gender varchar(255) not null,
                          city varchar(255) not null,
                          password varchar(255) not null,
                          confirm_password varchar(255) not null
                      );                  
                  ''');
      print("Table Created");
    });

  }

  /*//get detail according to roll number
  Future<Map<dynamic, dynamic>?> getStudent(int mobile) async {
    List<Map> maps = await db.query('registration',
        where: 'mobile = ?',
        whereArgs: [mobile]);
    //getting student data with roll no.
    if (maps.length > 0) {
      return maps.first;
    }
    return null;
  }*/
}