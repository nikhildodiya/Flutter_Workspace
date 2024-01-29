import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Model.dart';

class PhotoService
{
  Future<List<photos>> getPhotos() async
  {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200)
    {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => photos.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}