import 'package:editupdatedelete/view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Edit extends StatefulWidget
{
  final List list;
  final int index;


  Edit({required this.list, required this.index});


  @override
  _EditState createState() => _EditState();

}

class _EditState  extends State<Edit>
{
  late TextEditingController name;
  //TextEditingController surname;
  late TextEditingController email;


  @override
  void initState()
  {
    // TODO: implement initState
    name = TextEditingController(text: widget.list[widget.index]['Name']);
    email = TextEditingController(text: widget.list[widget.index]['email']);


    super.initState();
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar:  AppBar(

        title: Text("Edit Data ${widget.list[widget.index]['Name']}"),
      ),

      body: ListView(
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(hintText: "Enter Your Name",labelText: "Enter Name"),
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(hintText: "Enter Your Email",labelText: "Enter Email"),

          ),



          MaterialButton(
            child: Text("Edit Data"),
            onPressed: (){
              editData();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context)=> ViewData()),
              );
            },
          )
        ],
      ),
    );
  }

  void editData()
  {
    var url =Uri.parse("https://nikhil2293.000webhostapp.com/API/dataupdate.php");
    http.post(url as Uri,body: {

      'id':widget.list[widget.index]['id'],
      'name': name.text.toString(),
      'email': email.text.toString(),
    });


  }

}