//70. Create an application with bottom navigation with 3 tabs Gallery, audio and video and design each page with dummy data

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget
{
  @override
  playState createState() => playState();
}

class playState extends State<MyApp>
{

  int _currentIndex = 0;


  final List<Widget> _screens = [
    Gallery(),
    audio(),
    video(),
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("screen"),),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Gallery',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack),
            label: 'audio',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection),
            label: 'video',
          ),


        ],
      ),

    );
  }
}


// Gallery
class Gallery extends StatefulWidget
{
  @override
  GalleryState createState() =>   GalleryState();


}

class GalleryState extends State<Gallery>
{
  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: Text('Photo hear'),
    );

  }

}

//audio
class audio extends StatefulWidget
{
  @override
  audioState createState() =>   audioState();


}

class audioState extends State<audio>
{

  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: Text('Audio hear'),
    );
  }

}

//video
class video extends StatefulWidget
{
  @override
  videoState createState() =>   videoState();


}

class videoState extends State<video>
{
  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: Text('video hear'),
    );
  }
}