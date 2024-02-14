import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageViewTest1 extends StatefulWidget
{
  @override
  pageState createState() => pageState();

}

class pageState extends State<PageViewTest1>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Page View"),),
      body: PageView(

        children: [

          Container(
            color: Colors.orange,
            child: Center(
                child: Text(
                  'Page 1',
                  style: TextStyle(color: Colors.white),
                )),
          ),

          Container(
            color: Colors.blue,
            child: Center(
                child: Text(
                  'Page 2',
                  style: TextStyle(color: Colors.white),
                )),
          ),

          Container(
            color: Colors.blueAccent,
            child: Center(
                child: Text(
                  'Page 3',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}