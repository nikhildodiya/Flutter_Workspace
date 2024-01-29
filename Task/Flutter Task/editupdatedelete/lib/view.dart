import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import 'details.dart';

class ViewData extends StatefulWidget
{
  @override
  ViewState createState() => ViewState();

}

class ViewState extends State<ViewData>
{
  bool _enabled = false;

  @override
  Widget build(BuildContext context) {


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

            return Expanded(child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey,
              enabled: _enabled,
              child: ListView.builder(
                itemBuilder: (_, __) =>
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row
                        (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 48.0,
                            height: 48.0,
                            color: Colors.white,
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(()
                                  {
                                    _enabled = !_enabled;
                                  });
                                },
                                child: Text
                                  (
                                  _enabled ? 'Stop' : 'Play',
                                )),
                          )
                        ],
                      ),
                    ),
                itemCount: 6,
              ),
            ));



          }),
    );


  }

  Future<List>getdetail()async
  {
    var response = await http.get(Uri.parse("https://nikhil2293.000webhostapp.com/API/view.php"));
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


              title: Text(list[i]['Name']),
              subtitle: Text(list[i]['email']),
              //index send
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Details(list:list,index:i)
              )));
        }
    );
  }
}