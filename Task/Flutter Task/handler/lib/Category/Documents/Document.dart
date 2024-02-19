import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;

class DocumentUploadScreen extends StatefulWidget
{
  @override
  _DocumentUploadScreenState createState() => _DocumentUploadScreenState();
}

class _DocumentUploadScreenState extends State<DocumentUploadScreen> {
  String? selectedDocument = 'Select Documents';
  List<String> documentOptions = [
    'Select Documents',
    'Aadhar Card',
    'Voter ID Card',
    'Ration Card',
    'Birth Certificate',
    'Educational Documents',
    'PAN Card',
    'Passport',
    'Marriage Certificate',
    'Bank Documents',
    'Property Documents',
    'Medical Insurance Policy',
    'Income Tax Returns (ITR) Acknowledgment',
    'Loan Documents',
    'Insurance Policies',
    'Job Offer Letter and Appointment Letter',
    'Vehicle Registration Certificate (RC Book)',
    'Electricity and Water Bills',
    'Investment Documents',
    'GST Registration Certificate',
    'Caste Certificate',
    'Trade License',
    'NOC (No Objection Certificate)',
    'LPG Connection Documents',
    'Senior Citizen Card',
    'Disability Certificate',
    'Membership Certificates',
    'Power of Attorney',
  ];

  String _filePath = ''; // Declare _filePath variable


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Document Upload'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment. center,
            children: [
              SizedBox(height: 200,),
              Text("Documents:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
              Container(
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                height: 50,
                child: DropdownButton<String>(
                  value: selectedDocument,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 20,
                  elevation: 14,
                  style: TextStyle(color: Colors.white),
                  underline: Container
                    (
                    height: 2,
                    color: Colors.white,
                  ),
                  onChanged: (String? newValue)
                  {
                    setState(()
                    {
                      selectedDocument = newValue!;
                    });
                  },
                  items: documentOptions.map<DropdownMenuItem<String>>((String value)
                  {
                    return DropdownMenuItem<String>
                      (
                      value: value,
                      child: Text(value, style: TextStyle(fontSize: 16),),
                    );
                  }).toList(),
                ),
              ),

              SizedBox(height: 50,),
              ElevatedButton
                (
                  style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent), // Background color
                side: MaterialStateProperty.all<BorderSide>
                  (
                  BorderSide(color: Colors.grey), // Border color and width
                ),
                minimumSize: MaterialStateProperty.all<Size>(Size(250, 50)),
                elevation: MaterialStateProperty.all<double>(4.0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
                  onPressed: ()
                  {
                   _pickPDF();
                  }, child: Text("Pick Documents",
                style: TextStyle
                  (
                    fontWeight: FontWeight.bold, fontSize: 18),
                  )
              ),

              SizedBox(height: 30,),

              ElevatedButton
                (
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent), // Background color
                    side: MaterialStateProperty.all<BorderSide>
                      (
                      BorderSide(color: Colors.grey), // Border color and width
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(Size(250, 50)),
                    elevation: MaterialStateProperty.all<double>(4.0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  onPressed: ()
                  {
                    _uploadPDF();
                  }, child: Text("Upload Documents",
                style: TextStyle
                  (
                    fontWeight: FontWeight.bold, fontSize: 18),
              )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _filePath = result.files.first.path ?? '';
        print('Selected PDF Path: $_filePath');
      });
    }
  }

  Future<void> _uploadPDF() async
  {
    try
    {
      if (_filePath.isEmpty)
      {
        print('No file selected');
        return;
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://nikhil2293.000webhostapp.com/API/Handler/upload.php'),
      );

      request.files.add(await http.MultipartFile.fromPath(
        'file',
        _filePath,
        filename: _filePath.split('/').last,
      ));

      print(request);

      var response = await request.send();
    } catch (e) {
      print('Error: $e');
    }
  }

}