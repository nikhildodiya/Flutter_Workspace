import 'package:api_login_form/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class RegistrationForm extends StatefulWidget
{
  RegState createState() => RegState();
}

class RegState extends State<RegistrationForm>
{

  TextEditingController First_Name = TextEditingController();
  TextEditingController Last_Name = TextEditingController();
  TextEditingController Gender = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Password = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      backgroundColor: Colors.black,
      body: Center
        (
        child: Column
          (
          crossAxisAlignment: CrossAxisAlignment.center,


          children:
          [
            SizedBox(height: 80),
            Text("Create An Account", style: TextStyle(fontSize: 24, color: Colors.white),),

            SizedBox(height: 5),


            TextField
              (
              controller: First_Name,
              decoration: InputDecoration
                (
                border: OutlineInputBorder
                  (
                  borderRadius: BorderRadius.circular(202.0),
                ),

                prefixIcon: Icon(Icons.person),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[700]),
                hintText: "First Name",
                fillColor: Colors.white,
              ),
            ),

            SizedBox(height: 5),

            TextField
              (
              controller: Last_Name,
              decoration: InputDecoration
                (
                border: OutlineInputBorder
                  (
                  borderRadius: BorderRadius.circular(202.0),
                ),

                prefixIcon: Icon(Icons.person),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[700]),
                hintText: "Last Name",
                fillColor: Colors.white,
              ),
            ),

            SizedBox(height: 5),


            TextField
              (
              controller: Gender,
              decoration: InputDecoration
                (
                border: OutlineInputBorder
                  (
                  borderRadius: BorderRadius.circular(202.0),
                ),

                prefixIcon: Icon(Icons.person),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[700]),
                hintText: "Gender",
                fillColor: Colors.white,
              ),
            ),

            SizedBox(height: 5),


            TextField
              (
              controller: Email,
              decoration: InputDecoration
                (
                border: OutlineInputBorder
                  (
                  borderRadius: BorderRadius.circular(202.0),
                ),

                prefixIcon: Icon(Icons.email),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[700]),
                hintText: "Email",
                fillColor: Colors.white,
              ),
            ),

            SizedBox(height: 5),


            TextField
              (
              controller: Phone,
              decoration: InputDecoration
                (
                border: OutlineInputBorder
                  (
                  borderRadius: BorderRadius.circular(202.0),
                ),

                prefixIcon: Icon(Icons.phone),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[700]),
                hintText: "Phone",
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
                  borderRadius: BorderRadius.circular(202.0),
                ),

                prefixIcon: Icon(Icons.password),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[700]),
                hintText: "Password",
                fillColor: Colors.white,
              ),
            ),

            /*CheckboxListTile
              (
              title: Text('Pizza'),
              subtitle: Text('Rs. 100'),
              value: one,
              onChanged: (bool value)
              {
                setState(()
                {
                  one = value;
                }
                );
              },
            ),*/

            SizedBox(height: 10),


            ElevatedButton(onPressed: ()
            {

              var url = Uri.parse("https://nikhil2293.000webhostapp.com/API/register.php");
              http.post(url,

                  body:
                  {
                    "First_Name":First_Name.text.toString(),
                    "Last_Name":Last_Name.text.toString(),
                    "Gender":Gender.text.toString(),
                    "Email":Email.text.toString(),
                    "Phone":Phone.text.toString(),
                    "Password":Password.text.toString(),
                  }
              );
            }, child: Text("Register")),

            SizedBox(height: 10),

            Text("or Countinue With", style: TextStyle(color: Colors.white),),

            SizedBox(height: 10),

            Row
              (
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                ElevatedButton(onPressed: ()
                {
                  facebook();
                },
                    child: Text("Facebook")),

                SizedBox(width: 15),

                ElevatedButton(onPressed: ()
                {
                  google();
                },
                    style: ElevatedButton.styleFrom
                      (
                      padding: EdgeInsets.all(10.0),
                    ),
                    child: Text("Google")),
              ],
            ),

            Row
              (
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Text("Don't Have Account Yet?", style: TextStyle(color: Colors.white),),
                SizedBox(width: 2),
                GestureDetector
                  (
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  child: Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void facebook()
  {
    var url = Uri.parse("https://www.facebook.com");
    launchUrl(url);
  }

  void google()
  {
    var url = Uri.parse("https://www.google.com");
    launchUrl(url);
  }

}
