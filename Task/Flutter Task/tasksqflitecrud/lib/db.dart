import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Mydb
{

  late Database db;

  Future open()async
  {
    var databasesPath = await getDatabasesPath();//database path decide
    String path = join(databasesPath,'task.db');
    print(path);

    db = await openDatabase(path,version: 1,onCreate:(Database db, int version) async
    {

      await db.execute('''

                    CREATE TABLE IF NOT EXISTS students
                    ( 
                          id int primary key,
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

                      //create more table here
                  
                  ''');


      print("Table Created");
    });



  }

  Future<Map<dynamic,dynamic>?> getsinglerecord(String email)async
  {

    List<Map> maps = await db.query('students', where: 'email = ?',whereArgs: [email.toString()]);

    if (maps.length > 0)
    {
      return maps.first;
    }
    return null;

  }


}