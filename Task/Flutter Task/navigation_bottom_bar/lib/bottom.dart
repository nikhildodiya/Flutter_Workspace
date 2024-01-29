import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_bottom_bar/sec.dart';

class MyApp5 extends StatefulWidget
{
  @override
  BottomNavigationState createState() => BottomNavigationState();

}

class BottomNavigationState extends State<MyApp5>
{
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>
  [
    Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(title: Text("Bottom Navigation"),),
      body: Center
        (
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar:BottomNavigationBar(items: <BottomNavigationBarItem>
      [


        BottomNavigationBarItem
          (
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green
        ),

        BottomNavigationBarItem
          (
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.green
        ),

        BottomNavigationBarItem
          (
            icon: Icon(Icons.abc_sharp),
            label: 'SHarp',
            backgroundColor: Colors.green
        ),



      ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ) ,

    );


  }


  void _onItemTapped(int value)
  {
    setState(() {

      _selectedIndex = value;

      if(_selectedIndex==0)
        {
            Navigator.push(context, MaterialPageRoute(builder: (context) => sec()));
        }
        else if(_selectedIndex==1)
        {
            Navigator.pop(context);
        }

    });
  }
}