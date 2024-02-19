import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'AddWebsitePassword.dart';
import 'EditWebsitePassword.dart';

class WebsitePasswordView extends StatefulWidget
{
  @override
  WebsitePasswordViewState createState() => WebsitePasswordViewState();
}

class WebsitePasswordViewState extends State<WebsitePasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Website Password"),
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Website()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
          setState(() {});
        },
        child: FutureBuilder<List>
          (
          future: getdetail(),
          builder: (ctx, ss) {
            if (ss.connectionState == ConnectionState.waiting) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Items(list: []),
              );
            } else if (ss.hasData) {
              if (ss.data!.isEmpty) {
                // Display a message when there is no data
                return Center(
                  child: Text(
                    'No data available.',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              } else {
                // Display the data
                return Items(list: ss.data!);
              }
            } else if (ss.hasError) {
              print('Network Not Found');
            }
            return SizedBox();
          },
        ),
      ),
    );
  }

  Future<List> getdetail() async
  {
    var response = await http.get(Uri.parse("https://nikhil2293.000webhostapp.com/API/Handler/handlerwebsitepasswordview.php"));
    return jsonDecode(response.body);
  }
}

Future<void> deleteBusiness(BuildContext context, String businessId) async
{
  var url = Uri.parse
    ("https://nikhil2293.000webhostapp.com/API/Handler/handlerwebsitepassworddelete.php");
  var response = await http.post(url, body: {"Id": businessId});

  if (response.statusCode == 200)
  {
    ScaffoldMessenger.of(context).showSnackBar
      (
      SnackBar
        (
        content: Text("Website Password Entry Deleted Successfully",
            style: TextStyle(color: Colors.white)),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.black,
      ),
    );
  }
  else
  {
    ScaffoldMessenger.of(context).showSnackBar
      (
      SnackBar
        (
        content: Text(
            "Failed to delete Website Password. Please try again.",
            style: TextStyle(color: Colors.white)),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.black,
      ),
    );
  }
}

void _copyToClipboard(String password)
{
  Clipboard.setData(ClipboardData(text: password));
  Fluttertoast.showToast(
    msg: "Password copied to clipboard",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
  );
}


class Items extends StatelessWidget
{
  final List list;

  Items({required this.list});

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (ctx, i) {
        return WebsitepasswordTile(data: list[i]);
      },
    );
  }
}

class WebsitepasswordTile extends StatelessWidget
{
  final Map<String, dynamic> data;

  WebsitepasswordTile({required this.data});

  @override
  Widget build(BuildContext context)
  {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          data['Website_Name'],
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        //subtitle: Text('Person Name: ${data['Person_Name']}'),
        onTap: ()
        {
          Navigator.push
            (
            context,
            MaterialPageRoute(
              builder: (context) => WebsitePasswordScreen(data: data),
            ),
          );
        },
      ),
    );
  }
}

class WebsitePasswordScreen extends StatelessWidget
{
  final Map<String, dynamic> data;

  WebsitePasswordScreen({required this.data});

  Future<void> _deleteBusiness(BuildContext context) async
  {
    showDialog
      (
      context: context,
      builder: (BuildContext context)
      {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text("Are you sure you want to delete this Website Password entry?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Cancel", style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () async
              {
                await deleteBusiness(context, data['Id']);
                Navigator.pop(context); // Close the dialog
                Navigator.pop(context); // Close the BusinessDetailsScreen
              },
              child: Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Website Password Details"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Website Name: ${data['Website_Name']}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            GestureDetector(
              onTap: () {
                launch(data['Website_Link']);
              },
              child: Text(
                'Website Link: ${data['Website_Link']}',
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(height: 8.0),
            Text('Email: ${data['Usernam_Or_Email']}'),
            SizedBox(height: 8.0),
            Text('Username: ${data['Website_UserID']}'),
            Row(
              children: [
                Text('Website Password:'),
                SizedBox(width: 10,),
                Expanded(
                  child: ObscureText(
                    data['Website_Password'], // Your password data
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () => _copyToClipboard(data['Website_Password']),
                ),
              ],
            ),

            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom
                    (
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditWebsitePassword(data: data),
                      ),
                    );
                  },
                  child: Text('Edit', style: TextStyle(color: Colors.black),),
                ),
                ElevatedButton(
                  onPressed: () => _deleteBusiness(context),
                  style: ElevatedButton.styleFrom
                    (
                    primary: Colors.red, // Set button color to red
                  ),
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ObscureText extends StatefulWidget
{
  final String text;
  final TextStyle style;

  ObscureText(this.text, {required this.style});

  @override
  _ObscureTextState createState() => _ObscureTextState();
}

class _ObscureTextState extends State<ObscureText>
{
  bool _obscure = true;

  @override
  Widget build(BuildContext context)
  {
    return Row(
      children: [
        Expanded(
          child: Text(
            _obscure ? '•' * widget.text.length : widget.text,
            style: widget.style,
          ),
        ),
        IconButton(
          icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
          onPressed: ()
          {
            setState(()
            {
              _obscure = !_obscure;
            });
          },
        ),
      ],
    );
  }
}