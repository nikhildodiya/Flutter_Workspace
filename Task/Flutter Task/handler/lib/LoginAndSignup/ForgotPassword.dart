import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ForgotPasswordScreen extends StatelessWidget
{
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email or Phone Number",
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: ()
              {
                String emailOrPhone = emailController.text;


              },
              child: Text("Send Reset Link / OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
