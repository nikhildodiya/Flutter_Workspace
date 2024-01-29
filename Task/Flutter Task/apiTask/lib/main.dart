import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main()
{
  runApp(MaterialApp(home:task(),));
}

class task extends StatefulWidget
{
  @override
  ViewState createState() => ViewState();

}

class ViewState extends State<task>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("Indian Cricketers"),),
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
    var response = await http.get(Uri.parse("https://simplifiedcoding.net/demos/marvel/"));
    return jsonDecode(response.body);
  }
}

class Items extends StatelessWidget {
  List list;

  Items({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

        itemCount: list == null ? 0 : list.length,
        itemBuilder: (ctx, i) {
          return Card(
            child: ListTile(
              leading: Image.network(
                list[i]['imageurl'],
                width: 100,
                height: 700,
                fit: BoxFit.cover,
              ),
              title: Column(
                children: [
                  Container(
                    child: Column(
                      children: [

                        Row(children:
                        [
                          const Text("Name :-", style: TextStyle(
                              fontWeight: FontWeight.bold),),
                          Text(list[i]['name'],),
                        ],),

                        Row(children:
                        [
                          Text("Realname :-", style: TextStyle(
                              fontWeight: FontWeight.bold),),
                          Text(list[i]['realname'],),
                        ],),

                        Row(children: [
                          Text("Team :-", style: TextStyle(
                              fontWeight: FontWeight.bold),),
                          Text(list[i]['team'],),
                        ],),

                        Row(children: [
                          Text("Firstappearance :-", style: TextStyle(
                              fontWeight: FontWeight.bold),),
                          Text(list[i]['firstappearance'],),
                        ],),

                        Row(children: [
                          Text("Createdby :-", style: TextStyle(
                              fontWeight: FontWeight.bold),),
                          Text(list[i]['createdby'],),
                        ],),

                        Row(children: [
                          Text("Publisher :-", style: TextStyle(
                              fontWeight: FontWeight.bold),),
                          Text(list[i]['publisher'],),
                        ],),

                        Row(children: [Text("Bio :-", style: TextStyle(
                            fontWeight: FontWeight.bold),),
                        ],),
                        Text(list[i]['bio'],),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}