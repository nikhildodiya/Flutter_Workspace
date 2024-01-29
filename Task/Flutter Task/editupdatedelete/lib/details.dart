import 'package:editupdatedelete/view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'edit.dart';

class Details extends StatefulWidget
{
  List list;
  int index;

  //index get
  Details({required this.list, required this.index});

  @override
  _DetailsState createState() => _DetailsState();

}
class _DetailsState extends State<Details>
{

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(

        appBar: AppBar(title: Text('${widget.list[widget.index]['Name']}'),),

        body: Container(
            child: Column(
                children: [


                  Text(
                    widget.list[widget.index]['Name'],
                    style: TextStyle(fontSize: 20.0),
                  ),

                  Text(
                    widget.list[widget.index]['email'],

                  ),

                  MaterialButton(
                    child: Text("Edit"),
                    color: Colors.deepPurpleAccent,

                    onPressed: ()=>Navigator.of(context).push
                      (
                      MaterialPageRoute(builder: (BuildContext context)=> Edit(list:widget.list,index:widget.index)),
                    ),
                  ),

                  MaterialButton(
                      child: Text("Delete"),
                      color: Colors.deepPurpleAccent,
                      onPressed: ()
                      {
                        confirm();
                      }
                  )
                ]
            )
        )
    );
  }


  void confirm()
  {

    var url = Uri.parse("https://nikhil2293.000webhostapp.com/API/datadelete.php");
    http.post(url as Uri,body:
    {
      'id':widget.list[widget.index]['id'],

    });
    Navigator.of(context).push
      (
        MaterialPageRoute(builder: (BuildContext context)=> ViewData())
      );
  }
}