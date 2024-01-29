import 'package:flutter/material.dart';

class Model extends StatelessWidget {
  late List list;
  Model({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, i) {
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Adjust margins
          child: ListTile(
            contentPadding: EdgeInsets.all(16),
            leading: Image.network(
              list[i]['category_img'],
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
            title: Text(
              list[i]['category_name'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            tileColor: Colors.grey[200],
          ),
        );
      },
    );
  }
}