import 'package:asswsment1/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AddProduct.dart';
import 'Profile.dart';
import 'ViewProduct.dart';

class HomePage extends StatefulWidget
{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  late String emailid, pass;
  late SharedPreferences logindata;

  late String name = '';
  late String email = '';

  @override

  void initState()
  {
    super.initState();
    initial();
  }

  void initial() async
  {
    logindata = await SharedPreferences.getInstance();
    //newuser = (logindata.getBool('login') ?? true);
    setState(()
    {
      emailid = logindata.getString('emailid')!;
      pass = logindata.getString('pass')!;
      name = logindata.getString('name') ?? '';
      email = logindata.getString('email') ?? '';
    });
  }
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("View Details"),

          actions: <Widget>
          [
              _buildPopupMenu(),
          ],
        ),
      body: WillPopScope
        (
          onWillPop: () async
          {
]            return await showDialog<bool>(
              context: context,
              builder: (BuildContext context)
              {
                return AlertDialog(
                  icon: Icon(Icons.exit_to_app_rounded),
                  title: Text('Do you really want to exit?'),
                  actions: <Widget>
                  [
                    TextButton
                      (
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text('Yes'),
                      ),
                    TextButton
                      (
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text('No'),
                      ),
                  ],
                );
              },
            ) ?? false;
          },


        child: Center
          (
            child: Column
              (
                 children:
                 [
                   ElevatedButton(onPressed: ()
                   {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProduct()));
                   }, child: Text("Add Product")),

                   SizedBox(height: 20),
                   ElevatedButton(onPressed: ()
                   {
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProduct()));
                   }, child: Text("View Product"))
                 ],
              ),
          ),
      ),
    );
  }

  void _logout() async
  {
    logindata = await SharedPreferences.getInstance();
    logindata.setBool('login', true); // Set the login flag back to true.
    Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(builder: (context) => MyApp()));
  }

  Widget _buildPopupMenu()
  {
    return PopupMenuButton<String>
      (
        onSelected: (value)
      {
        if (value == 'logout')
        {
          _logout();
        }
        else if
        (value == 'profile')
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile(name: name, email: email)));
        }
      },
      itemBuilder: (BuildContext context)
      {
        return ['profile', 'logout'].map((String choice)
        {
          return PopupMenuItem
          (
              value: choice,
              child: Text(choice),
          );
        }).toList();
      },
    );
  }
}