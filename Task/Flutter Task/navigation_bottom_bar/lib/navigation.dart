import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp6 extends StatefulWidget
{
  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<MyApp6>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(title:Text("Navigation Drawer"),),
      body: Center(),
      drawer: Drawer(

        child: ListView(

            padding: EdgeInsets.zero,
            children: [

              UserAccountsDrawerHeader
                (
                  accountName: Text("Nikhil Dodiya"),
                  accountEmail: Text("Dodiyaniks@gmail.com"),
                  currentAccountPicture: CircleAvatar
                    (
                    child: Image.network("https://nikhil2293.000webhostapp.com/Images/python.png"),
                  )
              ),

              ListTile(

                leading: Icon(Icons.home), title: Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },


              ),

              ListTile(

                leading: Icon(Icons.home), title: Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },


              ),

              ListTile
                (

                leading: Icon(Icons.home), title: Text("Home"),
                onTap: ()
                {
                  Navigator.pop(context);
                },


              )

            ]

        ),
      ),
    );
  }
}