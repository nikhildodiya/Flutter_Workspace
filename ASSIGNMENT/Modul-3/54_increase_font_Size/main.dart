


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatefulWidget
{
  @override
  fontState createState() => fontState();


}

class fontState extends State<MyApp>
{

  double _fontsize = 14.0; // defult font size

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("Font Size Changer"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Text("Hello World", style: TextStyle(fontSize: _fontsize),),
            SizedBox(width: 100,height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                IconButton
                  (
                  icon: Icon(Icons.add),
                  iconSize: 50,
                  padding: EdgeInsets.all(50),
                  color: Colors.blue,
                  onPressed: ()
                  {
                    _increaseFontSize();
                  },
                ),

                IconButton
                  (
                  icon: Icon(Icons.remove),
                  iconSize: 50,
                  color: Colors.blue,
                  padding: EdgeInsets.all(50),
                  onPressed: ()
                  {
                    _decreaseFontSize();
                  },
                ),


              ],
            )

          ],
        ),
      ),
    );
  }

  void _increaseFontSize()
  {
    setState(() {
      _fontsize += 6.0;
    });
  }

  void _decreaseFontSize()
  {
    setState(() {
      _fontsize -= 6.0;
    });
  }
}