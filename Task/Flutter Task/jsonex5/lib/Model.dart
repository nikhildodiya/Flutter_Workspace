import 'package:flutter/material.dart';

class Model extends StatelessWidget {
  late List<Map<String, dynamic>> list;
  Model({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: ()
          {
            _showFullDetails(context, list[i]);
          },
          child: Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: Image.network(
                list[i]['Image'],
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
              title: Text(
                list[i]['Title'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              tileColor: Colors.grey[200],
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Text(
                    'Desc: ${list[i]['Desc']}',
                    style: TextStyle
                      (
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                      ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),


                  Text
                    (
                    'Platform: ${list[i]['Platform']}',
                    style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showFullDetails(BuildContext context, Map<String, dynamic> item)
  {
    showDialog(
      context: context,
      builder: (BuildContext context)
      {
        return AlertDialog(
          title: Text(item['Title']),
          content: Column
            (
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children:
            [
              Text('Desc: ${item['Desc']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10,),

              Text('Platform: ${item['Platform']}',
                style: TextStyle(fontWeight: FontWeight.bold),

              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: ()
              {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}