import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(home: FirstPage());
  }
}

class FirstPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(appBar: AppBar(title: Text("Operating Systems"),),
        body: Center
          (
          child: Column(

            children:
              [
                Image.asset("assets/linux.jpg", width: 250,height: 100),

                SizedBox(width: 5,height: 5,),

                ElevatedButton
                  (
                    onPressed: ()
                    {
                       websitelaunch();
                    },
                    child: Text("About Linux")
                ),

                ElevatedButton
                  (
                    onPressed: ()
                    {
                      callnum();
                    },
                    child: Text("Call Me")
                  ),

                Image.asset("assets/android.jpg",width: 250,height: 100,),

                SizedBox(width: 5,height: 5),

                ElevatedButton
                  (
                    onPressed: ()
                {

                  androidweb();

                },
                    child: Text("About Android")),

                ElevatedButton
                (
                    onPressed: ()
                {
                  callme();
                },
                    child: Text("Call Me")),


                Image.asset("assets/ios.png",width: 250,height: 100,),

                SizedBox(width: 5,height: 5),

                ElevatedButton
                  (
                    onPressed: ()
                    {

                      iosla();

                    },
                    child: Text("About Ios")),

                ElevatedButton
                  (
                    onPressed: ()
                    {
                      callus();
                    },
                    child: Text("Call Me")),


              ]
          ),
        )
    );
  }

  void websitelaunch() async
  {
    var url = Uri.parse("https://www.linux.com");
    launchUrl(url);
  }

 void callnum() async
 {
    var url = Uri.parse("tel: 8999959991");
    launchUrl(url);
 }

  void androidweb()
  {
    var url = Uri.parse("https://www.android.com");
        launchUrl(url);
  }

  void callme()
  {
    var url = Uri.parse("tel: 8000599949");
    launchUrl(url);
  }

  void iosla()
  {
    var url = Uri.parse("https://www.ios.com/");
    launchUrl(url);
  }

  void callus()
  {
    var url = Uri.parse("tel: 7878170717");
    launchUrl(url);
  }
}