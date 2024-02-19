import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shimmer/shimmer.dart';
import '../Business/EditBusiness.dart';
import '../CreditCard/ViewCreditCard.dart';
import 'AddComputerLogin.dart';
import 'EditComputerLogin.dart';

class ComputerLoginView extends StatefulWidget
{
  @override
  ComputerLoginViewState createState() => ComputerLoginViewState();
}

class ComputerLoginViewState extends State<ComputerLoginView>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Computer Login Details"),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () async 
            {
              var result = await showSearch(
                context: context,
                delegate: ComputerLoginSearch(),
              );

              if (result != null) {
                print('Selected computer: $result');
              }
            },
            icon: Icon(Icons.search),
          ),


          IconButton(
              onPressed: ()
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AddComputerLogin()));
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: RefreshIndicator
        (
        onRefresh: () async
        {
          await Future.delayed(Duration(milliseconds: 500));
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
    var response = await http.get(Uri.parse("https://nikhil2293.000webhostapp.com/API/Handler/handlercomputerview.php"));
    return jsonDecode(response.body);
  }
}

class ComputerLoginSearch extends SearchDelegate<String>
{
  List<String> computerNames =
  [

  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: ()
        {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context)
  {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context)
  {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
    final suggestionList = query.isEmpty
        ? computerNames
        : computerNames
        .where((name) => name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }
}


Future<void> deleteComputerLogin(BuildContext context, String ComputerId) async
{
  var url = Uri.parse
    ("https://nikhil2293.000webhostapp.com/API/Handler/handlercomputerdelete.php");
  var response = await http.post(url, body: {"Id": ComputerId});

  if (response.statusCode == 200)
  {
    ScaffoldMessenger.of(context).showSnackBar
      (
      SnackBar
        (
        content: Text("Computer Login entry deleted successfully",
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
            "Failed to delete Computer Login entry. Please try again.",
            style: TextStyle(color: Colors.white)),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.black,
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
    return ListView.builder
      (
      itemCount: list.length,
      itemBuilder: (ctx, i)
      {
        return BusinessTile(data: list[i]);
      },
    );
  }
}

class BusinessTile extends StatelessWidget
{
  final Map<String, dynamic> data;

  BusinessTile({required this.data});

  @override
  Widget build(BuildContext context)
  {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          data['computer_name'],
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        onTap: ()
        {
          Navigator.push
            (
            context,
            MaterialPageRoute
              (
              builder: (context) => ComputerDetailsScreen(data: data),
            ),
          );
        },
      ),
    );
  }
}

class ComputerDetailsScreen extends StatelessWidget
{
  final Map<String, dynamic> data;

  ComputerDetailsScreen({required this.data});

  Future<void> _deleteComputerLogin(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text("Are you sure you want to delete this Computer Login entry?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Cancel", style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () async {
                await deleteComputerLogin(context, data['Id']);
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
        title: Text("Computer Login Details"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Computer Name: ${data['computer_name']}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('IP Address: ${data['computer_ip']}'),
            SizedBox(height: 8.0),
            Text('Username: ${data['computer_username']}'),
            SizedBox(height: 8.0),
            Row(
              children: [
                Text('Password:'),
                SizedBox(width: 10,),
                Expanded(
                  child: ObscureText(
                    data['computer_password'], // Your password data
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () => _copyToClipboard(data['computer_password']),
                ),
              ],
            ),
            Text('Email Address: ${data['computer_email']}'),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditComputerLogin(data: data),
                      ),
                    );
                  },
                  child: Text('Edit', style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () => _deleteComputerLogin(context),
                  style: ElevatedButton.styleFrom(
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
  }}

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