//Q57. Write a program in android display screen color which the Color will be select from the radio button.

import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(),));
}


class MyApp extends StatefulWidget {
  @override
  _ColorSelectorScreenState createState() => _ColorSelectorScreenState();
}

class _ColorSelectorScreenState extends State<MyApp>
{
  Color selectedColor = Colors.red;

  void _handleColorChange(Color? color)
  {
    if (color != null)
    {
      setState(()
      {
        selectedColor = color;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Selector'),
      ),
      body: Container(
          color: selectedColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RadioListTile<Color>(
                title: Text('Red'),
                value: Colors.red,
                groupValue: selectedColor,
                onChanged: _handleColorChange,
              ),

              RadioListTile<Color>(
                title: Text('Yellow'),
                value: Colors.yellow,
                groupValue: selectedColor,
                onChanged: _handleColorChange,
              ),

              RadioListTile<Color>(
                title: Text('Blue'),
                value: Colors.lightBlue,
                groupValue: selectedColor,
                onChanged: _handleColorChange,
              ),
              SizedBox(height: 20),
            ],
          )
      ),
    );
  }
}