import 'package:flutter/material.dart';
import 'package:module_5/BottomNavigation/profile.dart';
import 'BottomNavigation/task.dart';
import 'Crud/add.dart';

class HomePage extends StatefulWidget
{
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomePage>
{
  int _currentIndex = 0;

  final List<Widget> _tabs =
  [
    TaskTab(),
    AddTask(),
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar
        (
        backgroundColor: Colors.deepPurple,
        fixedColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (int index)
        {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem
          (
            backgroundColor: Colors.purple,
            icon: Icon(Icons.book),
            label: 'Tasks',
          ),
          BottomNavigationBarItem
          (
            backgroundColor: Colors.deepPurple,
            icon: Icon(Icons.add),
            label: 'Add Task',
          ),
        ],
      ),
    );
  }
}