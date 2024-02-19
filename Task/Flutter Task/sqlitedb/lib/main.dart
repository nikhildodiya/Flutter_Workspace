import 'package:flutter/material.dart';

import 'Firstpage.dart';

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
          home: FirstPage(),
  debugShowCheckedModeBanner: false,
      );
  }
}