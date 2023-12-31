import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Splashscreen.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp
    (home: MyApp(),
        debugShowCheckedModeBanner: false,
    ));
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        body: Splashscreenpage(),
      );
  }
}