import 'package:editupdatedelete/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget
{
  @override
  AddState createState() => AddState();

}

class AddState extends State<AddData>
{

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(title: Text("Student Details"),),
      body: ListView(

          children: [

            TextField(
              controller: name ,
              decoration: InputDecoration(hintText: "Enter Your Name",labelText: "Enter Your Name"),
            ),

            TextField(
              controller: email,
              decoration: InputDecoration(hintText: "Enter Your Email",labelText: "Enter Your Email"),
            ),

            ElevatedButton(onPressed: ()
            {

              //insertdata();
              var url=Uri.parse("https://nikhil2293.000webhostapp.com/API/login.php");
              http.post(url,

                  body:
                  {
                    "name":name.text.toString(),
                    "email":email.text.toString(),
                  }

              );

              print('Inserted');
              Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context)=>ViewData()),
                    );


            }, child: Text("Submit")),

            ElevatedButton(onPressed: (){

              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context)=>ViewData()),
              );

            }, child: Text("View Data"))







          ]


      ),



    );
  }



}