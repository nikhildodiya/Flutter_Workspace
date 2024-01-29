import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Dashboard.dart';
import 'RegistrationForm.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget
{
  @override
  LoginState createState() => LoginState();

}

class LoginState extends State<Login> {

  TextEditingController Phone = TextEditingController();
  TextEditingController Password = TextEditingController();
 //1
  late SharedPreferences logindata;
  late bool newuser;
  var isLoading = false;

  //3
  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    //4
    check_if_already_login();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Center
        (
        child: Column
          (
          crossAxisAlignment: CrossAxisAlignment.center,

          children:
          [

            SizedBox(height: 150),
            Text("Hey There", style: TextStyle(color: Colors.white),),
            SizedBox(height: 1),
            Text("Welcom Back",
              style: TextStyle(color: Colors.white, fontSize: 18),),

            SizedBox(height: 5),


            TextField
              (
              controller: Phone,
              decoration: InputDecoration
                (

                border: OutlineInputBorder
                  (
                  borderRadius: BorderRadius.circular(100),
                ),
                prefixIcon: Icon(Icons.phone),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[700]),
                hintText: "Number",
                fillColor: Colors.white,
              ),
            ),

            SizedBox(height: 5),

            TextField
              (
              controller: Password,
              decoration: InputDecoration
                (
                border: OutlineInputBorder
                  (
                  borderRadius: BorderRadius.circular(100.0),
                ),
                prefixIcon: Icon(Icons.password_outlined),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[700]),
                hintText: "Password",
                fillColor: Colors.white,
              ),
            ),

            SizedBox(height: 15),

            Text(
              "Forgot Your Password.?", style: TextStyle(color: Colors.white),),

            SizedBox(height: 15),

            ElevatedButton(
                style: ButtonStyle
                  (
                  minimumSize: MaterialStateProperty.all(Size(200, 50)),
                  elevation: MaterialStateProperty.all(4.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder
                      (
                      borderRadius: BorderRadius.circular(50.0),
                    ),),
                ),
                onPressed: () async
                {
                  var url = Uri.parse(
                      "https://nikhil2293.000webhostapp.com/API/insert.php");

                  var response = await http.post(url, body:
                  {
                    "Phone": Phone.text.toString(),
                    "Password": Password.text.toString(),
                  });
                  var data = json.decode(response.body);
                  if (data == 0)
                  {
                    'Please Enter Correct Phone Or Password';
                  }
                  else
                  {
                    //2
                    logindata.setBool('login', false);
                    logindata.setString('phone',Phone.text.toString());

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  }
                }, child: Text("Login")),

            SizedBox(height: 10),

            Text("or Countinue With", style: TextStyle(color: Colors.white),),

            SizedBox(height: 10),

            Row
              (
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                ElevatedButton
                  (
                  style: ElevatedButton.styleFrom
                    (
                      backgroundColor: Colors.grey,
                    ),
                    onPressed: ()
                    {
                      facebook();
                    },
                    child: Text("Facebook")),

                SizedBox(width: 15),

                ElevatedButton
                  (
                    style: ElevatedButton.styleFrom
                      (
                      backgroundColor: Colors.grey,
                    ),
                    onPressed: ()
                    {
                      facebook();
                    },
                    child: Text("Google")),
              ],
            ),

            Row
              (
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Text("Don't Have Account Yet?",
                  style: TextStyle(color: Colors.white),),
                SizedBox(width: 2),
                GestureDetector
                  (
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => RegistrationForm()),);
                  },
                  child: Text('Register', style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void facebook() {
    var url = Uri.parse("https://www.facebook.com");
    launchUrl(url);
  }

  void google() {
    var url = Uri.parse("https://www.google.com");
    launchUrl(url);
  }

  //if user is already loggedin
  void check_if_already_login()async
  {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false)
    {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => MyApp()));
    }

  }
}
