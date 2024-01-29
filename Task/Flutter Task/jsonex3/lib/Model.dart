
import 'package:flutter/material.dart';

class Model extends StatelessWidget
{
  late List<Map<String, String>> list;
  Model({required this.list});

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder
      (
      itemCount: list.length,
      itemBuilder: (context, i)
      {
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                   Image.network(
                    list[i]['imageurl'] ?? '',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text(list[i]['name'] ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,),),
                      Text(list[i]['realname'] ?? '', style: TextStyle(fontWeight: FontWeight.bold,),),
                      /*Text('Team: ${list[i]['team']}', style: TextStyle(fontWeight: FontWeight.bold),
                      Text('First Appearance: ${list[i]['firstappearance']}', style: TextStyle(fontWeight: FontWeight.bold),
                      Text('Created By: ${list[i]['createdby']}', style: TextStyle(fontWeight: FontWeight.bold),
                      Text('Publisher: ${list[i]['publisher']}', style: TextStyle(fontWeight: FontWeight.bold),*/
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
            //  Text('Bio: ${list[i]['bio']}', style: TextStyle(fontWeight: FontWeight.bold),
            ],
          )
        );
      },
    );
  }
}