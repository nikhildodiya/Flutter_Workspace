import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'ViewPrivatePhotos.dart';

class AddPrivatePhotos extends StatefulWidget
{
  @override
  _AddPrivatePhotosState createState() => _AddPrivatePhotosState();
}

class _AddPrivatePhotosState extends State<AddPrivatePhotos> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadImage() async {
    if (_image == null) {
      return; // No image selected
    }

    var url = Uri.parse('https://nikhil2293.000webhostapp.com/Handler/privatesafe.php');

    var request = http.MultipartRequest('POST', url);

    var pic = await http.MultipartFile.fromPath('profile_pic', _image!.path);
    request.files.add(pic);

    var response = await request.send();
    if (response.statusCode == 200)
    {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Image Added successful", style: TextStyle(color: Colors.white),),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.black,
        ),
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>view()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Image Upload Fail", style: TextStyle(color: Colors.white),),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.black,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Upload Image'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image!),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: getImage,
            tooltip: 'Select Image',
            child: Icon(Icons.photo_library),
          ),
          SizedBox(height: 10),
          FloatingActionButton
          (
            onPressed: uploadImage,
            tooltip: 'Upload Image',
            child: Icon(Icons.cloud_upload),
          ),
        ],
      ),
    );
  }
}