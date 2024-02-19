import 'package:flutter/material.dart';
import 'package:tasksqflitecrud/viewdata.dart';

import 'adddata.dart';

void main()
{
  runApp(MaterialApp(home:MyApp(),
  debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: ViewData(),
    );
  }
}