import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:handler/LoginAndSignup/SignUp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../HomePage/HomePage.dart';
import 'OtpScreen.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>
{
  final _formKey = GlobalKey<FormState>();

  TextEditingController Number = TextEditingController();
  TextEditingController Password = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;
  var isLoading = false;

  bool _passwordVisible = false;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _handleSignInWithGoogle() async
  {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null)
      {
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      print("Signed in with Google: ${user?.displayName}");
    } catch (error)
    {
      print("Error signing in with Google: $error");
    }
  }


  @override
  void initState()
  {
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async
  {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false)
    {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form
        (
        key: _formKey,
        child: Center
          (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent), // Background color
                  side: MaterialStateProperty.all<BorderSide>
                  (
                    BorderSide(color: Colors.grey), // Border color and width
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(Size(250, 50)),
                  elevation: MaterialStateProperty.all<double>(4.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                onPressed: _handleSignInWithGoogle,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/google.png", height: 20, width: 20),
                    SizedBox(width: 8),
                    Text("Sign in With Google", style: TextStyle(fontSize: 17, color: Colors.white)),
                  ],
                ),
              ),


              SizedBox(height: 8),

              Text("OR", style: TextStyle(color: Colors.white, fontSize: 18)),

              SizedBox(height: 8),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent), // Background color
                  side: MaterialStateProperty.all<BorderSide>
                    (
                    BorderSide(color: Colors.grey, width: 2.0), // Border color and width
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)),
                  elevation: MaterialStateProperty.all<double>(4.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/phone.png", height: 20, width: 20),
                    SizedBox(width: 8),
                    Text("Signin With Phone", style: TextStyle(fontSize: 17,color: Colors.white)),
                  ],
                ),
              ),

              SizedBox(height: 8),

              Text("OR", style: TextStyle(color: Colors.white, fontSize: 18)),

              SizedBox(height: 8),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),

                width: 370,
                height: 60,


                child: TextFormField(
                  controller: Number,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white, // Change border color when focused
                        width: 2.0,
                      ),
                    ),
                    prefixIcon: Icon(Icons.phone_android_outlined, color: Colors.white),
                    labelText: "Mobile Number",
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "Enter Your Mobile Number",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value)
                  {
                    if (value == null || value.isEmpty || value.length != 10)
                    {
                      return 'Please enter Valid Mobile number';
                    }
                    return null;
                  },
                ),
              ),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(6.0),

                width: 370,
                height: 60,

                child: TextFormField(
                  controller: Password,
                  keyboardType: TextInputType.text,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration
                    (
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide
                        (
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    fillColor: Colors.white,
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "Enter Your Password",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (passcurrentvalue)
                  {
                    RegExp regex = RegExp
                      (
                        r'^(?=.*?[a-z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    var passnonnullvalue = passcurrentvalue ?? "";
                    if (passnonnullvalue.isEmpty) {
                      return ("password is required");
                    } else if (passnonnullvalue.length < 6) {
                      return ("password must be more than 5 characters");
                    } else if (!regex.hasMatch(passnonnullvalue)) {
                      return ("password should contain upper, lower, digit, and special character ");
                    }
                    return null;
                  },
                ),
              ),

              SizedBox(height: 10),

              TextButton(onPressed: ()
                {
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword))
                }, child: Text("Forgot Password.??",
                    style: TextStyle
                      (
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    )
                  ),

              SizedBox(height: 10),

              ElevatedButton
                (
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent), // Background color
                    side: MaterialStateProperty.all<BorderSide>
                      (
                      BorderSide(color: Colors.grey), // Border color and width
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(Size(250, 50)),
                    elevation: MaterialStateProperty.all<double>(4.0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  onPressed: () async
                  {
                    var url = Uri.parse("https://nikhil2293.000webhostapp.com/API/Handler/HandlerLogin.php");

                    try {
                      var response = await http.post(url, body:
                      {
                        "Number": Number.text.toString(),
                        "Password": Password.text.toString(),
                      });

                      print("Response body: ${response.body}");

                      var data = json.decode(response.body);

                      if (data == 0) {
                        // Handle the case where data is 0
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Please Enter Correct Phone Or Password',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.black,
                          ),
                        );
                      } else {
                        // Handle the case where data is not 0
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Please.. Enter OTP',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.black,
                          ),
                        );
                        logindata.setBool('login', false);
                        logindata.setString('Number',Number.text.toString());
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OTPScreen(phoneNumber: Number.text.toString())));
                      }
                    }
                    catch (error)
                    {
                      print("Error decoding JSON: $error");

                      // Handle the error, show a relevant message to the user or log it for debugging
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'An error occurred while processing the response.',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.black,
                        ),
                      );
                    }
                 },
                  child: Text("Sign In", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),

                SizedBox(height: 15),

              Row
                (
                mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Text("If You Don't Have Account.??",
                            style: TextStyle
                          (
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),

                    TextButton(onPressed: ()
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder:
                              (context)=>SignUp()));
                    }, child: Text("Sign Up",
                      style: TextStyle
                        (
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}