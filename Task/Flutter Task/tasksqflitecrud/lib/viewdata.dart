import 'package:flutter/material.dart';

import 'adddata.dart';
import 'db.dart';
import 'editdata.dart';
import 'main.dart';

class ViewData extends StatefulWidget
{
  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData>
{
  late Mydb db = Mydb();
  List<Map> slist = [];

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  void getdata() async
  {
    await  db.open();
    Future.delayed(Duration(milliseconds: 500), () async
    {
      try
      {
        slist = await db.db.rawQuery('SELECT * FROM students');
        setState(() {});
      } catch (e)
      {
        print('Error fetching data: $e');
      }
    });
  }

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(

        appBar: AppBar(title: Text("View Details"),
          actions:
          [
            IconButton
              (
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AddData()));
                }, icon: Icon(Icons.add))
          ],
        ),
        body:  SingleChildScrollView
          (
            child: Container
              (

                child: slist.length == 0 ?
                Text("No any students to show.")
                    :
                Column(

                    children: slist.map((stuone)
                    {
                      return Card
                        (
                        child: ListTile(
                          title: Text(stuone["first_name"]),
                          subtitle: Text("Last Name: ${stuone["last_name"]},"
                              "Mobile: ${stuone["mobile"]},"
                              "Email: ${stuone["email"]},"
                              "Hobbies: ${stuone["hobbies"]},"
                              "Gender: ${stuone["gender"]},"
                              "City: ${stuone["city"]},"
                              "Password: ${stuone["password"]},"
                              "Confirm Password: ${stuone["confirm_password"]},"),

                          trailing: Wrap(

                            children: [

                              IconButton
                                (
                                  onPressed: ()
                                  {
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => EditStudent(email: stuone["email"])));
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(onPressed: ()
                              {
                                db.db.rawDelete("DELETE FROM students where Email = ?",[stuone["email"]]);
                                print("Data Deleted");
                                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ViewData()));
                              }, icon: Icon(Icons.delete)),

                            ],


                          ),
                        ),
                      );
                    })
                        .toList())
            )
      )
    );
  }
}