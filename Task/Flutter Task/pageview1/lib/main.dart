import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'myapp.dart';

void main()
{
  runApp(MaterialApp
    (
        title: "pageview Example",
    theme: ThemeData
      (
          primarySwatch: Colors.brown,
      ),

    home: MyApp(),
    debugShowCheckedModeBanner: false,
    ));
}