  import 'package:flutter/material.dart';
  import 'package:http/http.dart' as http;
  import 'dart:convert';
  import 'package:shimmer/shimmer.dart';
  import 'AddBusiness.dart';
  import 'EditBusiness.dart';

  class BusinessView extends StatefulWidget
  {
    @override
    BusinessViewState createState() => BusinessViewState();
  }

  class BusinessViewState extends State<BusinessView>
  {
    TextEditingController searchController = TextEditingController();

    List<Map<String, dynamic>> slist = [];


    @override
    void initState()
    {
      super.initState();
      getdetail();
    }

    @override
    Widget build(BuildContext context)
    {
      return Scaffold
        (
       // backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Business Details"),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () async {
                final String? selected = await showSearch(
                  context: context,
                  delegate: BusinessSearch(businesses: slist.map((e) => e["Business_Name"] as String).toList()),
                );
                if (selected != null && selected != 'SELECT * FROM Task ORDER BY Business_Name0') {
                  filterTasks(selected);
                }
              },
              icon: Icon(Icons.search),
            ),


            IconButton(
                onPressed: ()
                {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Business()));
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
                Container(
                  width: double.infinity,
                  height: 200.0, // Set a specific height
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Items(list: []),
                  ),
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
      var response = await http.get(Uri.parse("https://nikhil2293.000webhostapp.com/API/Handler/handlerbusinessview.php"));
      return jsonDecode(response.body);
    }
    void filterTasks(String query)
    {
      if (query.isEmpty)
      {
        setState(() {
          slist = [];
        });
      } else {
        List<Map<String, dynamic>> filteredList = slist
            .where((task) =>
        task["Business_Name"]
            .toLowerCase()
            .contains(query.toLowerCase()) ||
            task["Person_Name"]
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            task["Contact_Person"]
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            task["Business_Address"]
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            task["Email_Address"]
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
        setState(() {
          slist = filteredList;
        });
      }
    }


  }


  class BusinessSearch extends SearchDelegate<String>
  {
    final List<String> businesses;

    BusinessSearch({required this.businesses});

    @override
    List<Widget> buildActions(BuildContext context)
    {
      return [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
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
      final suggestionList = businesses
          .where((business) =>
          business.toLowerCase().contains(query.toLowerCase()))
          .toList();

      return ListView.builder
        (
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            query = suggestionList[index];
           // Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessDetailsScreen(data: data)));
          },
        ),
      );
    }
  }


  Future<void> deleteBusiness(BuildContext context, String businessId) async
  {
    var url = Uri.parse
      ("https://nikhil2293.000webhostapp.com/API/Handler/handlerbusinessdelete.php");
    var response = await http.post(url, body: {"Id": businessId});

    if (response.statusCode == 200)
    {
      ScaffoldMessenger.of(context).showSnackBar
        (
        SnackBar
        (
          content: Text("Business entry deleted successfully",
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
              "Failed to delete business entry. Please try again.",
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
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (ctx, i) {
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
            data['Business_Name'],
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          onTap: ()
          {
            Navigator.push
              (
              context,
              MaterialPageRoute
              (
                builder: (context) => BusinessDetailsScreen(data: data),
              ),
            );
          },
        ),
      );
    }
  }

  class BusinessDetailsScreen extends StatelessWidget {
    final Map<String, dynamic> data;

    final String? selectedBusinessName;

    BusinessDetailsScreen({required this.data, this.selectedBusinessName});

    Future<void> _deleteBusiness(BuildContext context) async
    {
      showDialog
        (
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
            title: Text("Confirm Delete"),
            content: Text("Are you sure you want to delete this business entry?"),
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
    Widget build(BuildContext context)
    {
      return Scaffold(
        appBar: AppBar(
          title: Text("Business Details"),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Text(
                'Business Name: ${data['Business_Name']}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text('Person Name: ${data['Person_Name']}'),
              SizedBox(height: 8.0),
              Text('Contact Person: ${data['Contact_Person']}'),
              SizedBox(height: 8.0),
              Text('Business Address: ${data['Business_Address']}'),
              SizedBox(height: 8.0),
              Text('Email Address: ${data['Email_Address']}'),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                [
                  ElevatedButton
                    (
                    style: ElevatedButton.styleFrom
                    (
                      primary: Colors.white,
                    ),
                    onPressed: ()
                    {
                      Navigator.push
                        (
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditBusinessDetails(data: data),
                        ),
                      );
                    },
                    child: Text('Edit', style: TextStyle(color: Colors.black),),
                  ),
                  ElevatedButton
                    (
                    onPressed: () => _deleteBusiness(context),
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
  }