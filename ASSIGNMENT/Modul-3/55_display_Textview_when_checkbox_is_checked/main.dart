import 'package:flutter/material.dart';


void main()
{
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatefulWidget
{
  @override
  TextviewState createState() => TextviewState();
}

class TextviewState extends State<MyApp>
{
  bool _isChecked = false;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Textview"),
      ),
      body: Column(
        children: <Widget>
        [
          CheckboxListTile(
            title: Text('Policy'),
            subtitle: Text('Read before submit'),
            value: _isChecked,
            onChanged: (bool? value)
            {
              setState(()
              {
                _isChecked = value ?? false;
              });
            },
          ),
          if (_isChecked)
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "A Text is a widget in Flutter that allows us to display a string of text with a single line in our application. Depending on the layout constraints, we can break the string across multiple lines or might all be displayed on the same line.",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
        ],
      ),
    );

  }
}