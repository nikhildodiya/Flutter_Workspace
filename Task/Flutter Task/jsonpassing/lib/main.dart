import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main()
{
  runApp(MaterialApp(home:MyView()));
}

class MyView extends StatefulWidget
{
  @override
  MYViewState createState() => MYViewState();

}

class MYViewState extends State<MyView>
{
  @override
  Widget build(BuildContext context)
  {

    return Scaffold(

      appBar: AppBar(title: Text("View Details"),),
      body: FutureBuilder<List>(
          future: getdetail(),
          builder:(ctx,ss){

            if(ss.hasData)
            {

              return Items(list:ss.data!);

            }
            if(ss.hasError)
            {
              print('Network Not Found');
            }

            return CircularProgressIndicator();



          }),
    );


  }

  Future<List>getdetail()async
  {
    var response = await http.get(Uri.parse("https://vyasprakruti.000webhostapp.com/flutterapi/dataview.php"));
    return jsonDecode(response.body);
  }

}

class Items extends StatelessWidget
{
  List list;
  Items({required this.list});

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder(

        itemCount: list==null?0:list.length,
        itemBuilder: (ctx,i)
        {

          return ListTile(

            title: Text(list[i]['name']),
            subtitle: Text(list[i]['email']),

          );

        }


    );
  }
}