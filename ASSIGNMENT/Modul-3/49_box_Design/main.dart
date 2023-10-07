import 'package:flutter/material.dart';

import 'boxes.dart';

void main()
{
  runApp(MaterialApp
    (
    title: "this is UI",
    theme: ThemeData(primarySwatch:Colors.green
    ),
    debugShowCheckedModeBanner: false,

    home: page1(),
  ));
}