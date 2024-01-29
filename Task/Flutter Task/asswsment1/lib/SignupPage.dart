import 'dart:io';
import 'dart:typed_data';
import 'package:asswsment1/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'main.dart';



class SignupPage extends StatefulWidget
{
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignupPage>
{

  Uint8List? _image;
  void selectimage() async
  {
    var img = await pickImage(ImageSource.gallery);
        setState(()
        {
          _image = img;
        });
  }

  final _formKey = GlobalKey<FormState>();


  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController password = TextEditingController();
  /*Future<void> _pickImage() async
  {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
*/
  TextEditingController conpassword = TextEditingController();


  void _cleartext()
  {
    name.clear();
    email.clear();
    dob.clear();
    password.clear();
    conpassword.clear();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Registration Form"),
      ),
      body: SingleChildScrollView
        (
        child: Form
          (
          key: _formKey,
          child: Column(
            children:
            [
              SizedBox(height: 10),
            Stack
              (
                children:
                [
                  _image != null ?
                  CircleAvatar
                  (
                    radius: 64,
                    backgroundImage: MemoryImage(_image!),
                  )
                  :
                  CircleAvatar
                    (
                      radius: 65,
                      backgroundImage: AssetImage('image/profile.jpg'),
                    ),
                  Positioned
                    (
                      child: IconButton
                      (
                      onPressed: selectimage,
                      icon: Icon(Icons.add_a_photo),
                  ),
                    bottom: -10,
                    left: 80,
                  )
                ],
              ),

              SizedBox(height: 10),
              Text("Add Profile Image",
                style: TextStyle
                  (
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                  ),
                ),
              SizedBox(height: 10),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(2.0),

                width: 350,
                height: 60,

                child: TextFormField
                  (
                  controller: name,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                    {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration
                    (
                    border: OutlineInputBorder
                      (
                      borderRadius: BorderRadius.circular(100),
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.grey),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
                    hintText: "Full Name",
                    fillColor: Colors.white,
                  ),
                ),
              ),

              Container(

                alignment: Alignment.center,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),

                width: 350,
                height: 60,

                child: TextFormField
                  (
                  controller: email,
                  validator: (value)
                  {
                    if (value == null || value.isEmpty)
                    {
                      return 'Please enter your email address';
                    }
                    if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$").hasMatch(value))
                    {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration
                    (
                    border: OutlineInputBorder
                      (
                      borderRadius: BorderRadius.circular(100),
                    ),
                    prefixIcon: Icon(Icons.email, color: Colors.grey),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
                    hintText: "Email",
                    fillColor: Colors.white,
                  ),
                ),
              ),

              Container(

                alignment: Alignment.center,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),

                width: 350,
                height: 60,

                child: TextFormField
                  (
                  controller: dob,
                  validator: (value)
                  {
                    if (value == null || value.isEmpty)
                    {
                      return 'Please enter your Date Of Birth';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration
                    (
                    border: OutlineInputBorder
                      (
                      borderRadius: BorderRadius.circular(100),
                    ),
                    prefixIcon: Icon(Icons.date_range, color: Colors.grey),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
                    hintText: "Date Of Birth",
                    fillColor: Colors.white,
                  ),
                ),
              ),

              Container
                (
                alignment: Alignment.center,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),

                width: 350,
                height: 60,

                child: TextFormField
                  (
                  controller: password,
                  validator: (value)
                  {
                    if (value == null || value.isEmpty)
                    {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration
                    (
                    border: OutlineInputBorder
                      (
                      borderRadius: BorderRadius.circular(100),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
                    hintText: "Password",
                    fillColor: Colors.white,
                  ),
                ),
              ),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5.0),
                // padding: EdgeInsets.all(5.0),

                width: 350,
                height: 60,

                child: TextFormField
                  (
                  controller: conpassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != password.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration
                    (
                    border: OutlineInputBorder
                      (
                      borderRadius: BorderRadius.circular(100),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
                    hintText: "Confirm Password",
                    fillColor: Colors.white,
                  )
                ),
              ),

              /*Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                width: 350,
                height: 60,
                child: ElevatedButton
                  (
                    onPressed: _pickImage,
                    child: Text("Pick Image"),
                ),
              ),*/


              SizedBox(height: 10),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  minimumSize: MaterialStateProperty.all(Size(250, 50)),
                  elevation: MaterialStateProperty.all(4.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder
                      (
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                onPressed: () async
                {
                  if (_formKey.currentState?.validate() ?? false)
                  {
                    var url = Uri.parse("https://nikhil2293.000webhostapp.com/API/asseinsert.php"
                    );
                    var response = await http.post(url,
                        body:
                        {
                          "name": name.text,
                          "email": email.text,
                          "dob": dob.text,
                          "password": password.text,
                          "conpassword": conpassword.text,
                        });

                    if (response.statusCode == 200)
                    {
                      // Registration successful
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Registration successful"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      _cleartext();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                    }
                    else
                    {
                      // Handle registration failure
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Registration failed. Please try again."),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  }
                },
                child: Text("Sign Up",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),

              Row
                (
                children:
                [
                  Text("You Have Account Account.??",
                    style: TextStyle
                      (
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  TextButton(onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                  },
                      child: Text
                        (
                        "Sign In",
                        style: TextStyle
                          (
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*
"https://nikhil2293.000webhostapp.com/API/asseinsert.php"

{
if (_formKey.currentState?.validate() ?? false)
{
var request = http.MultipartRequest
(
'POST',
Uri.parse("https://nikhil2293.000webhostapp.com/API/asseinsert.php"),
);

request.fields.addAll({
"name": name.text,
"email": email.text,
"dob": dob.text,
"password": password.text,
"conpassword": conpassword.text,
});

if (_image != null)
{
var path;
var file = await http.MultipartFile.fromPath('image', _image!.path);
request.files.add(file);
}

var response = await request.send();


if (response.statusCode == 200)
{
// Registration successful
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text("Registration successful"),
duration: Duration(seconds: 2),
),
);
_cleartext();
Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
}
else
{
// Handle registration failure
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text("Registration failed. Please try again."),
duration: Duration(seconds: 2),
),
);
}
}
},*/
