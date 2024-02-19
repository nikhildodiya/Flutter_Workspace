//@dart=2.9

import 'package:flutter/material.dart';
import 'first.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
      (
        home: Scaffold(

          appBar: AppBar(
            title: Text("Form Example"),
          ),
          body: FirstPage(),

        ),
        debugShowCheckedModeBanner: false
    );
  }

}


