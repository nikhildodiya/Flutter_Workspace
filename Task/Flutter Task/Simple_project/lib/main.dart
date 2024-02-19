import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'listview.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(),
  debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget
{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  @override
  Widget build(BuildContext context)
  {
   return Scaffold
     (
        appBar: AppBar(title: Text('Social Media'),),
      body: customelistview(),
      );
  }
}
