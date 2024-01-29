import 'package:blood_bank/TextButton/Search.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Crud/AddDonor.dart';
import '../Crud/ViewDonor.dart';
import '../LoginAndRegistration/Login.dart';
import '../TextButton/profile.dart';

class HomePage extends StatefulWidget
{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<HomePage>
{

  final List<String> imageUrls =
  [
    'images/doo.jpeg',
    'images/doo1.jpeg',
    'images/dd2.jpeg',
  ];

  final List<String> imageurl =
  [
    'images/adddonor.png',
    'images/search.jpg',
  ];

  List<String> images =
  [
    "images/adddonor.png",
    "images/search.jpg",
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blood Bank"),
        backgroundColor: Colors.red,

//ACTION For Logout Button

        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout')
              {
                _logout();
              }
            },
            itemBuilder: (BuildContext context)
            {
              return ['logout'].map((String choice)
              {
                return PopupMenuItem
                  (
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children:
          [


            SizedBox(height: 10),

// Container For SlideBar
            Container
              (
                child: CarouselSlider
                  (options: CarouselOptions
                  (
                      height: 200.0,
                      aspectRatio: 20/9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                  ),
                     items: imageUrls.map((url)
                  {
                    return Builder
                      (
                      builder: (BuildContext context)
                      {
                        return Container
                          (
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Image.asset(
                            url,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),

// Row For Text Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: TextButton(
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                    },
                    child: Text("Home", style: TextStyle(color: Colors.red, fontSize: 18)),
                  ),
                ),

                TextButton(
                  onPressed: ()
                  {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Search()));

                  },
                  child: Text("Search", style: TextStyle(color: Colors.red, fontSize: 18)),
                ),
                TextButton(
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile()));
                  },
                  child: Text("Profile", style: TextStyle(color: Colors.red, fontSize: 18)),
                ),
              ],
            ),

            SizedBox(height: 5),

// Elevated Button
            ElevatedButton
              (
                style: ButtonStyle
                  (
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  minimumSize: MaterialStateProperty.all(Size(300, 40)),
                  elevation: MaterialStateProperty.all(4.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>
                    (
                    RoundedRectangleBorder
                      (
                          borderRadius: BorderRadius.circular(30.0),
                      ),
                  ),
                ),

                onPressed: ()
                {
                     CallDonor();
                },
                child: Text("Tap To Call", style: TextStyle(fontSize: 22)),
            ),


            ElevatedButton(onPressed: ()
        {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDonor()));
        }, child: Text("Add Donor")),


            ElevatedButton(onPressed: ()
            {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewDonor()));
            }, child: Text("View Donor")),
          ],
        ),
      ),
    );
  }

  void _logout() async
  {
      SharedPreferences logindata = await SharedPreferences.getInstance();
      logindata.setBool('login', true);
      logindata.remove('Number');

      // Navigate to the login screen
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
  }

  void CallDonor()
  {
    var url = Uri.parse("tel:''");
    launchUrl(url);
  }
}
