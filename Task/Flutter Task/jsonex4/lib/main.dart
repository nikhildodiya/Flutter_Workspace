import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

void main()
{
  runApp(MaterialApp(home:MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}
class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(title: Text("Json Parsing"),
      backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List>
        (
        future: getdata(),
        builder: (context,ss)
        {

          if(ss.hasData)
          {

            return Model(list:ss.data!!);

          }
          if(ss.hasError)
          {
            print('Network Not Found');
          }
          return CircularProgressIndicator();
        },

      ) ,

    );
  }

  Future<List> getdata()async
  {
    var response = await http.get(Uri.parse("https://nikhil2293.000webhostapp.com/API/taskview.php"));
    return jsonDecode(response.body);
  }
}
