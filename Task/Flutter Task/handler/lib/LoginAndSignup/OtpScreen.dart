import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import '../HomePage/HomePage.dart';
import 'dart:async';

class OTPScreen extends StatefulWidget
{
  final String phoneNumber;

  OTPScreen({required this.phoneNumber});

  late String maskedPhoneNumber;

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen>
{

  bool isVerifyingOTP = false;
  List<TextEditingController> otpControllers = List.generate(6, (index) => TextEditingController());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _verificationId;

  bool canResendOTP = false;
  late Timer _resendTimer;
  int _resendSeconds = 60;

  @override
  void dispose()
  {
    otpControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void initState()
  {
    super.initState();
    widget.maskedPhoneNumber = widget.phoneNumber.substring(widget.phoneNumber.length - 4);
    _verifyPhoneNumber();
  }

  void startResendTimer()
  {
    _resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(()
      {
        if (_resendSeconds > 0)
        {
          _resendSeconds--;
        } else
        {
          canResendOTP = true;
          _resendTimer.cancel();
        }
      });
    });
  }

  void resendOTP() {
    setState(() {
      canResendOTP = false;
      _resendSeconds = 60;
    });
    _verifyPhoneNumber();
    startResendTimer();
  }

  Future<void> _verifyPhoneNumber() async {
    String phoneNumberWithCountryCode = "+91" + widget.phoneNumber; // Adding "+91" to the phone number
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumberWithCountryCode,
      verificationCompleted: (PhoneAuthCredential credential) async
      {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Verification Failed: $e");
      },
      codeSent: (String? verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId!;
          canResendOTP = false;
          _resendSeconds = 60;
          startResendTimer();
        });
      },
      codeAutoRetrievalTimeout: (String verificationId)
      {
        // Auto-retrieval timeout, if needed.
      },
      timeout: Duration(seconds: 60),
    );
  }

  void _signInWithOTP(String smsCode) async
  {
    try
    {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      // User signed in successfully.
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(widget.phoneNumber)));
    } catch (e) {
      setState(() {
        isVerifyingOTP = false; // Set back to false to enable the button again
      });

      print("Sign In Failed: $e");

      String errorMessage = 'Incorrect OTP. Please try again.';

      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-verification-code') {
          errorMessage = 'Invalid OTP. Please check and try again.';
        }
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('OTP Verification'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Image.asset
                (
                  "assets/otp.png",
                  height: 200,
                  width: 200,
                ),

              SizedBox(height: 4,),
              Container(
                child: Column
                  (
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:
                  [
                    Text(
                      "OTP",
                      style: GoogleFonts.aleo(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                    Text(
                      "Verification",
                      style: GoogleFonts.aleo(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),

                    SizedBox(height: 4,),
                    Center(
                      child: Text(
                        "Enter One Time Password Sent On "
                            "+91 ****${widget.phoneNumber.substring(widget.phoneNumber.length - 4)}",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              SizedBox(height: 11,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  6,
                      (index) => SizedBox(
                    width: 40,
                    child: TextField(
                      controller: otpControllers[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      decoration: InputDecoration(
                        counter: Offstage(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onChanged: (value)
                      {
                        if (value.length == 1 && index < 5)
                        {
                          FocusScope.of(context).nextFocus();
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                        if (index == 5 && value.length == 1) {
                          // All OTP digits are entered, perform verification
                          String enteredOTP = otpControllers.map((controller) => controller.text).join();
                          _signInWithOTP(enteredOTP);
                        }
                      },
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Receive Code.?"),

                  TextButton(
                    onPressed: canResendOTP ? () => resendOTP() : null,
                    child: Text('Resend OTP'),
                  ),
                  canResendOTP
                      ? Text(
                    '  in $_resendSeconds seconds',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                      : SizedBox(),
                ],
              ),

              SizedBox(height: 10),
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
                onPressed: isVerifyingOTP
                    ? null
                    : () {
                  // Verify OTP button pressed
                  String enteredOTP = otpControllers.map((controller) => controller.text).join();
                  if (enteredOTP.length == 6) {
                    setState(() {
                      isVerifyingOTP = true;
                    });
                    _signInWithOTP(enteredOTP);
                  }
                },
                child: isVerifyingOTP
                    ? CircularProgressIndicator()
                    : Text('Verify OTP',
                  style: TextStyle
                    (
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}