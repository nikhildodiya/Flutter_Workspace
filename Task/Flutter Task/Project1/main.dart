import 'package:data1234/screens/user/splash_screen/SplashScreen.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp
      (
      debugShowCheckedModeBanner: false,
      title: 'E wishes',
      home: SplashScreen(),
    );
  }
}


