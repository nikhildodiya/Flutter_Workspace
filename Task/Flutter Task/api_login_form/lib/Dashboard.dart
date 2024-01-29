import 'package:api_login_form/productadd.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class MyApp extends StatelessWidget
{


  //json code



  // Create a list of ListItem objects
  final List<ListItem> items =
  [
    ListItem
      (
      // imageUrl: 'images/add.png',
      ElevatedButton
        (
          onPressed: ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductAdd()));
          },
          child: Text("Add Product"))
        ),
    ListItem(
      // imageUrl: 'images/add.png',
    ),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom ListView Example'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            //design
            return ListTile(
              leading: Image.asset(items[index].imageUrl),
              title: Text(items[index].title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(items[index].subtitle1,),
                  Text(items[index].subtitle2),

                ],
               ),
              // You can add more customization here, like onTap handlers, icons, etc.
            );
          },
        ),
      ),
    );
  }
}