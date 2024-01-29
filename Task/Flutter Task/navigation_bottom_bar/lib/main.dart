import 'package:flutter/material.dart';
import 'package:navigation_bottom_bar/navigation.dart';
import 'bottom.dart';

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
      debugShowCheckedModeBanner: false,
      home: MyApp5(),
    );
  }

}

class MyApp2 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("My App"),),
      body: Center
        (

        child: ElevatedButton(
          onPressed: ()
          {
            print("Clicked");
          },
          child: Text("Click Me"),),
      ),
    );
  }
}