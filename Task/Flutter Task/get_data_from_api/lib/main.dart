import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Model.dart';

void main()
{
  runApp(MaterialApp(
    home: PhotosScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class PhotosScreen extends StatefulWidget
{
  @override
  _PhotosScreenState createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  late Future<List<photos>> photosList;

  @override
  void initState()
  {
    super.initState();
    fetchData();
  }

  Future<List<photos>> fetchData() async
  {
    final response =
    await http.get(Uri.parse("https://nikhil2293.000webhostapp.com/API/asseview.php"));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      List<photos> photosList =
      jsonData.map((data) => photos.fromJson(data)).toList();
      return photosList;
    } else
    {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
      ),
      body: FutureBuilder<List<photos>>(
        future: photosList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: ()
                  {
                      _navigateToDetailsScreen(context, snapshot.data![index]);
                  },
                  child: Image.network(
                    snapshot.data![index].thumbnailUrl!,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void _navigateToDetailsScreen(BuildContext context, photos selectedPhoto) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoDetailsScreen(photo: selectedPhoto),
      ),
    );
  }
}

class PhotoDetailsScreen extends StatelessWidget {
  final photos photo;

  PhotoDetailsScreen({required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              photo.url!,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              photo.title!,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
