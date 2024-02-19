import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shimmer/shimmer.dart';

import '../Website Login/ViewWebsitePassword.dart';
import 'AddSocialMedia.dart';
import 'EditSocialMedia.dart';

class SocialMedia extends StatefulWidget
{
  @override
  SocialMediaViewState createState() => SocialMediaViewState();
}

class SocialMediaViewState extends State<SocialMedia>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Social Media Details"),
        backgroundColor: Colors.black,
        actions: [
          IconButton
            (onPressed: ()
          {

          }, icon: Icon(Icons.search)),

          IconButton(
              onPressed: ()
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AddSocialMedia()));
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: RefreshIndicator
        (
        onRefresh: () async
        {
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
    var response = await http.get(Uri.parse("https://nikhil2293.000webhostapp.com/API/Handler/handlersocialmediaview.php"));
    return jsonDecode(response.body);
  }
}

Future<void> deleteBusiness(BuildContext context, String businessId) async
{
  var url = Uri.parse
    ("https://nikhil2293.000webhostapp.com/API/Handler/handlersocialmediadelete.php");
  var response = await http.post(url, body: {"id": businessId});

  if (response.statusCode == 200)
  {
    ScaffoldMessenger.of(context).showSnackBar
      (
      SnackBar
        (
        content: Text("Social Media entry deleted successfully",
            style: TextStyle(color: Colors.black)),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.white,
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
            "Failed to delete Social Media entry. Please try again.",
            style: TextStyle(color: Colors.black)),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.white,
      ),
    );
  }
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
        return SocialTile(data: list[i]);
      },
    );
  }
}

class SocialTile extends StatelessWidget
{
  final Map<String, dynamic> data;

  SocialTile({required this.data});

  @override
  Widget build(BuildContext context)
  {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          data['selectedSocialMedia'],
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Name: ${data['Name']}'),
        onTap: () {
          Navigator.push
            (
            context,
            MaterialPageRoute(
              builder: (context) => SocialMediaScreen(data: data ?? {}),
            ),
          );
        },
      ),
    );
  }
}

class SocialMediaScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  SocialMediaScreen({required this.data});

  Future<void> _deleteSocialMedia(BuildContext context) async
  {
    showDialog
      (
      context: context,
      builder: (BuildContext context)
      {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text("Confirm Delete"),
          content: Text("Are you sure you want to delete this Social Media entry?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Cancel", style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () async
              {
                await deleteBusiness(context, data['id']);
                Navigator.pop(context); // Close the dialog
                Navigator.pop(context); // Close the BusinessDetailsScreen
              },
              child: Text("Delete", style: TextStyle(color: Colors.white)),
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
        title: Text("Social Media Details"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Social Media: ${data['selectedSocialMedia']}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Name: ${data['Name']}'),
            SizedBox(height: 8.0),
            Text('User Name: ${data['UserName']}'),
            SizedBox(height: 8.0),
            Row(
              children: [
                Text('Password:'),
                SizedBox(width: 8,),
                Expanded(
                  child: ObscureText(
                    data['Password'] ?? '', // Your password data
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () => _copyToClipboard(data['Password'] ?? ''),
                ),
              ],
            ),
            Text('Email: ${data['Email']}'),
            SizedBox(height: 8.0),
            Text('Mobile: ${data['Mobile']}'),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom
                    (
                    primary: Colors.white,
                  ),
                  onPressed: ()
                  {
                    Navigator.pushReplacement
                      (
                      context,
                      MaterialPageRoute
                        (
                        builder: (context) => EditSocialMedia(data: data),
                      ),
                    );
                  },
                  child: Text('Edit', style: TextStyle(color: Colors.black),),
                ),
                ElevatedButton
                  (
                  onPressed: () => _deleteSocialMedia(context),
                  style: ElevatedButton.styleFrom
                    (
                    primary: Colors.red,
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
  Widget build(BuildContext context) {
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