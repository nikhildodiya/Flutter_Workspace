import 'package:flutter/material.dart';

class Model extends StatelessWidget {
  late List list;
  Model({required this.list});

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, i)
      {
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10), // Adjust margins
          child: ListTile(
            contentPadding: EdgeInsets.all(1),
            leading: Image.network(
              list[i]['image'],
              width: 64,
              height: 60,
            fit: BoxFit.cover,
            ),
            title: Text(
              list[i]['and_version'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            tileColor: Colors.white38,
          subtitle: Text(list[i]['and_name'],
            style: TextStyle(
              color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
