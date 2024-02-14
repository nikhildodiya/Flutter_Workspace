import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pageview1/page1.dart';
import 'package:pageview1/page3.dart';
import 'package:pageview1/page4.dart';

class MyApp extends StatefulWidget
{  @override
  MyState createState() => MyState();
}

class MyState extends State<MyApp>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
          appBar: AppBar
            (
            title: Text("PageView"),
            centerTitle: true,
            elevation: 0,
            ),

      body: Center
        (
            child: Padding
              (
                  padding: EdgeInsets.all(10),
              child: Column
                (
                    mainAxisAlignment: MainAxisAlignment.center,

                children:
                [
                  SizedBox
                    (
                width: MediaQuery.of(context).size.width,
              child: MaterialButton(
                onPressed: ()
                {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => PageViewTest1()));
                },
                child: Text('PageView Example',style: TextStyle(color: Colors.white),),
                color: Colors.amber[800],
              ),
            ),

        SizedBox
          (
          width: MediaQuery.of(context).size.width,
          child: MaterialButton(
            onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => PageViewTest1()));
            },
            child: Text('PageView Example',style: TextStyle(color: Colors.white),),
            color: Colors.amber[800],
          ),
        ),

        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: MaterialButton(
            onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => PageViewCustom()));
            },
            child: Text('PageView Custom Example',style: TextStyle(color: Colors.white),),
            color: Colors.amber[800],
          ),
        ),

        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: MaterialButton(
            onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => CustomizedPageView()));
            },
            child: Text('Customized PageView Example',style: TextStyle(color: Colors.white),),
            color: Colors.amber[800],
          ),
        ),

                ],
                ),
              ),
        ),
      );
  }
}