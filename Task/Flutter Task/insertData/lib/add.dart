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

  TextEditingController Name = TextEditingController();
  TextEditingController Surname = TextEditingController();
  TextEditingController Email = TextEditingController();


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(title: Text("Student Details"),),
      body: ListView(

          children: [

            TextField(
              controller: Name ,
              decoration: InputDecoration(hintText: "Enter Your Name",labelText: "Enter Your Name"),
            ),
            TextField(
              controller: Surname,
              decoration: InputDecoration(hintText: "Enter Your Surname",labelText: "Enter Your Surname"),
            ),

            TextField(
              controller: Email,
              decoration: InputDecoration(hintText: "Enter Your Email",labelText: "Enter Your Email"),
            ),
            ElevatedButton(onPressed: ()
            {

              //insertdata();
              var url=Uri.parse("https://nikhil2293.000webhostapp.com/API/insert.php");
              http.post(url,

                  body:
                  {
                    "Name":Name.text.toString(),
                    "Surname":Surname.text.toString(),
                    "Email":Email.text.toString(),
                  }

              );

              print('Inserted');


            }, child: Text("Submit"))
          ]
      ),
    );
  }

  void insertdata()
  {




  }

}