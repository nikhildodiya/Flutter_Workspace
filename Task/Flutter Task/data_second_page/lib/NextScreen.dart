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
      appBar: AppBar(title: Text("$name"),backgroundColor: Colors.deepPurple,),

      body: Center
        (
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text("Welcome", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),),

            SizedBox(height: 5),

            Text("FirstName: $name", style: TextStyle(fontSize: 18),),
            Text("LastName: $lastname", style: TextStyle(fontSize: 18),),
            Text("Mobile: $mobile", style: TextStyle(fontSize: 18),),
            Text("Email: $email", style: TextStyle(fontSize: 18),),
            Text("Gender: $gendervalue", style: TextStyle(fontSize: 18),),
            Text("Hobbies: $hobbies", style: TextStyle(fontSize: 18),),
            Text("City: $city", style: TextStyle(fontSize: 18),),
            Text("PassWord: $password", style: TextStyle(fontSize: 18),),
            Text("ConfirmPassword: $confirmpaswword", style: TextStyle(fontSize: 18),),

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
