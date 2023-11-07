import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(),
  debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _pages =
  [
    GalleryPage(),
    AudioPage(),
    VideoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Drawer App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Navigation Drawer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery'),
              onTap: () {
                _changePage(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.audiotrack),
              title: Text('Audio'),
              onTap: () {
                _changePage(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.video_library),
              title: Text('Video'),
              onTap: () {
                _changePage(2);
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
    );
  }

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.of(context).pop(); // Close the drawer
    });
  }
}

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Gallery Page '),
    );
  }
}

class AudioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Audio Page '),
    );
  }
}

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Video Page'),
    );
  }
}