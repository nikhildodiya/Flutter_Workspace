import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Parsing Example"),
      ),
      body: FutureBuilder<List<Map<String, String>>>(
        future: getdata(),
        builder: (context, ss) {
          if (ss.hasData) {
            return Model(list: ss.data!);
          }
          if (ss.hasError) {
            print('Network Not Found');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Future<List<Map<String, String>>> getdata() async {
    var response = await http.get(Uri.parse("https://simplifiedcoding.net/demos/marvel/"));
    List<dynamic> jsonData = jsonDecode(response.body);

    // Convert List<dynamic> to List<Map<String, String>>
    List<Map<String, String>> result = jsonData.map((item) {
      return Map<String, String>.from(item);
    }).toList();

    return result;
  }
}