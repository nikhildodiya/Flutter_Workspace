import 'dart:typed_data';

import 'package:asswsment1/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'HomePage.dart';

class AddProduct extends StatefulWidget
{
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct>
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

  /*Future<void> _pickImage() async
  {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = _file(pickedFile.path);
      });
    }
  }
*/

  final _formKey = GlobalKey<FormState>();

  TextEditingController pname = TextEditingController();
  TextEditingController pprice = TextEditingController();
  TextEditingController pdes = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
      return Scaffold
        (
          appBar: AppBar(title: Text("Add Prodcut"),),

        body: SingleChildScrollView(
          child: Form
            (
            key: _formKey,
              child: Column
                (
                  children:
                  [
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
                    Text("Add Product Image",
                      style: TextStyle
                        (
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                    ),
                    SizedBox(height: 10),
                    Container
                      (
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(5.0),

                      width: 350,
                      height: 60,

                      child: TextFormField
                        (
                        controller: pname,
                        validator: (value)
                        {
                          if (value == null || value.isEmpty)
                          {
                            return 'Please enter your Product Name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration
                          (
                          border: OutlineInputBorder
                            (
                            borderRadius: BorderRadius.circular(100),
                          ),
                          prefixIcon: Icon(Icons.production_quantity_limits_outlined),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
                          hintText: "Product Name",
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
                        controller: pprice,
                        validator: (value)
                        {
                          if (value == null || value.isEmpty)
                          {
                            return 'Please enter your Product Price';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration
                          (
                          border: OutlineInputBorder
                            (
                            borderRadius: BorderRadius.circular(100),
                          ),
                          prefixIcon: Icon(Icons.price_check, color: Colors.grey),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
                          hintText: "Product Price",
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
                        controller: pdes,
                        validator: (value)
                        {
                          if (value == null || value.isEmpty)
                          {
                            return 'Please enter your Product Description';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration
                          (
                          border: OutlineInputBorder
                            (
                            borderRadius: BorderRadius.circular(100),
                          ),
                          prefixIcon: Icon(Icons.description, color: Colors.grey),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
                          hintText: "Product Description",
                          fillColor: Colors.white,
                        ),
                      ),
                    ),

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
                          var url = Uri.parse("https://nikhil2293.000webhostapp.com/API/assproductadd.php");
                          var response = await http.post(url,
                              body:
                              {
                                "pname": pname.text,
                                "pprice": pprice.text,
                                "pdes": pdes.text,
                              });

                          if (response.statusCode == 200)
                          {
                            // Registration successful
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Product SuccessFully Added"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                          }

                        }
                      },
                      child: Text("Add Product",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
            ),
        ),
      );
  }
}
