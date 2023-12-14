import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NextScreen extends StatelessWidget
{

  final String name, lastname, mobile, email, hobbies, gendervalue, city, password, confirmpaswword;


  NextScreen({required this.name, required this.lastname, required this.mobile, required this.email, required this.hobbies,
  required this.gendervalue, required this.city, required this.password, required this.confirmpaswword});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("User Details"),backgroundColor: Colors.deepPurple,),

      body: Center
        (
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text("Welcome", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),),

            SizedBox(height: 5,),
            Text("FirstName: $name"),
            Text("LastName: $lastname"),
            Text("Mobile: $mobile"),
            Text("Email: $email"),
            Text("Gender: $gendervalue"),
            Text("Hobbies: $hobbies"),
            Text("City: $city"),
            Text("PassWord: $password"),
            Text("ConfirmPassword: $confirmpaswword"),

            SizedBox(height: 11,),
            ElevatedButton(onPressed: ()
            {
              Navigator.pop(context);
            }, child: Text("Go Back"))
          ],
        ),
      ),
    );
  }
}
