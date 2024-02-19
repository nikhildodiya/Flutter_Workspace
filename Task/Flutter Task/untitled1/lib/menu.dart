import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'login.dart';

class MenuEx extends StatefulWidget
{
  @override
  MenuState  createState() => MenuState();
}

class MenuState extends State<MenuEx>
{
   late SharedPreferences Logindata;
   late String username;


   @override
  void initState()
   {
    // TODO: implement initState
    super.initState();
    initial();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(title: Text("Welcome $username"),),
      body: Center(

        child: Column(

          children:
          [

            ElevatedButton(onPressed: ()
            {
              Logindata.setBool('login', true);
              Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) => mylogin()));

            }, child: Text("Logout")),

          ],
        ),
      ),

    );
  }

  void initial() async
  {
     Logindata = await SharedPreferences.getInstance();
     setState(()
     {
          username = Logindata.getString('username')!;
     });
  }
}