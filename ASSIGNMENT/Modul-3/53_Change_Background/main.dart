import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(),)
  );
}
class MyApp extends StatefulWidget
{
  @override
  BackgroundChangerState createState() => BackgroundChangerState();
}

class BackgroundChangerState extends State<MyApp>
{
  Color _backgroundColor = Colors.white70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BackgroundChanger")),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _changeBackgroundColor,
                child: Text("Change color"),
              ),

            ],


          ),
        ),
      ),
    );
  }

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = _backgroundColor == Colors.black
          ? Colors.white
          : Colors.black;
    });
  }
}