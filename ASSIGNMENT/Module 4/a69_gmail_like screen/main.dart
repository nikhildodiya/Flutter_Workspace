//69. Create an application like gmail and display Screens according to user selection and design each page with dummy data

import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(),
  debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget
{
  @override
  _MyEmailAppState createState() => _MyEmailAppState();
}

class _MyEmailAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    InboxScreen(),
    SentScreen(),
    DraftsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Email App'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar
        (
        currentIndex: _currentIndex,
        onTap: (index)
        {
          setState(()
          {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: 'Sent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.drafts),
            label: 'Drafts',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton
        (
        child: Icon(Icons.send,),

        onPressed: ()
        {

        },
      ),
    );
  }
}

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2, // Number of emails
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.email),
          title: Text('Email Subject $index'),
          subtitle: Text('Sender: sender@example.com'),
        );
      },
    );
  }
}

class SentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: Text('Sent Emails'),
    );
  }
}

class DraftsScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Draft Emails'),
    );
  }
}