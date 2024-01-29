import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';

class MenuEx extends StatefulWidget
{
  @override
  MenuState  createState() => MenuState();
}

class MenuState extends State<MenuEx> {
  var data = "";
  late SharedPreferences logindata;
  late String username;

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Welcome $username"),),
      body: Center(

        child: Column(

          children:
          [
            SizedBox
              (
              width: 100,
            ),

            ElevatedButton(onPressed: ()
            {
              logindata.setBool('login', true);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Mylogin()));
            },
                child: Text("Logout"))
          ],
        ),
      ),

    );
  }
}


