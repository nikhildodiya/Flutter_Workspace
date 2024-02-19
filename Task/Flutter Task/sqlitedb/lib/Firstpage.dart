import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AddStudent.dart';
import 'ViewStudent.dart';

class FirstPage extends StatefulWidget
{
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<FirstPage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
          appBar: AppBar(title: Text("sqllitedb"),),

      body: Container
        (
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(20),
          child: Column
            (
                children:
                [
                  ElevatedButton
                    (
                      onPressed: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AddStudent()));
                      },
                      child: Text("Add Student")
                    ),

                    ElevatedButton
                    (
                      onPressed: ()
                     {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewStudent()));
                     },
                      child: Text("View Student")
                  ),

                ],
            ),
        ),
      );
  }
}
