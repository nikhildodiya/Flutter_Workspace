import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/login.dart';

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
      home: mylogin(),
      debugShowCheckedModeBanner: true,
    );
  }

}
