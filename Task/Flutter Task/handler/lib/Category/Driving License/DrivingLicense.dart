import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';

class DrivingLicense extends StatefulWidget
{
  @override
  _DrivingLicenseState createState() => _DrivingLicenseState();
}

class _DrivingLicenseState extends State<DrivingLicense>
{
  File? _selectedPdf;

  Future<void> _pickPdf() async
  {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null)
    {
      setState(()
      {
        _selectedPdf = File(result.files.single.path!);
      });
    }
  }

  Future<void> _uploadPdf() async {
    if (_selectedPdf == null) {
      // Show an error message or handle it accordingly
      return;
    }

    String url = 'YOUR_UPLOAD_API_ENDPOINT'; // Replace with your actual API endpoint

    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..files.add(
        await http.MultipartFile.fromPath(
          'pdf',
          _selectedPdf!.path,
        ),
      );

    try {
      http.Response response = await http.Response.fromStream(await request.send());

      // Handle the response, e.g., check if upload was successful
      print('Upload Response: ${response.body}');
    } catch (e) {
      print('Error uploading PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _selectedPdf != null
                ? Text('Selected PDF: ${_selectedPdf!.path}')
                : Text('No PDF selected'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickPdf,
              child: Text('Pick PDF'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadPdf,
              child: Text('Upload PDF'),
            ),
          ],
        ),
      ),
    );
  }
}
