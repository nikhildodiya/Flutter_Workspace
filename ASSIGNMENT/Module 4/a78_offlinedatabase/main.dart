import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(),
  debugShowCheckedModeBanner: false,
  ));
}


class MyApp extends StatefulWidget {
  @override
  _NameListScreenState createState() => _NameListScreenState();
}

class _NameListScreenState extends State<MyApp>
{
  final List<String> names = [];
  final TextEditingController _nameController = TextEditingController();
  String selectedName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name List'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(names[index]),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Selected Name'),
                          content: Text(names[index]),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  onLongPress: () {
                    _showContextMenu(index);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter a name',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _addName,
                  child: Icon(Icons.add),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addName()
  {
    setState(() {
      final name = _nameController.text;
      if (name.isNotEmpty)
      {
        names.add(name);
        _nameController.clear();
      }
    });
  }

  void _showContextMenu(int index)
  {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Item'),
              onTap: () {
                Navigator.of(context).pop();
                _editName(index);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete Item'),
              onTap: () {
                Navigator.of(context).pop();
                _confirmDelete(index);
              },
            ),
          ],
        );
      },
    );
  }

  void _editName(int index) {
    setState(() {
      final name = names[index];
      _nameController.text = name;
      names.removeAt(index);
    });
  }

  void _confirmDelete(int index)
  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  names.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}