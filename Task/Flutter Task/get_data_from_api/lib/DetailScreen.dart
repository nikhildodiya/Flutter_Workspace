import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Database.dart';
import 'Model.dart';
import 'ViewDownloadedImage.dart';

class NextScreen extends StatefulWidget
{

  final photos photo;
  NextScreen({required this.photo});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen>
{
  late DB db;
  String savePath = "";


  void initState()
  {
    super.initState();
    db = DB();
  }

  Future<String> createFolderInAppDocDir(String folderName) async
  {
    final Directory _appDocDir = await getApplicationDocumentsDirectory();
    final Directory _appDocDirFolder = Directory('${_appDocDir.path}/$folderName/');

    if (await _appDocDirFolder.exists())
    {
      return _appDocDirFolder.path;
    }
    else
    {
      final Directory _appDocDirNewFolder = await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }


  _save(String? url) async
  {
    _onLoad(true);
    var status = await Permission.storage.request();
    if (status.isGranted)
    {
      try
      {
        var response = await Dio().get(url!, options: Options(responseType: ResponseType.bytes));
        String fileName = DateTime.now().millisecondsSinceEpoch.toString() + ".jpg"; // Generate a unique file name with a JPG extension
        savePath = await createFolderInAppDocDir("storage/emulated/0/Pictures/$fileName");
        File file = File('$savePath/$fileName');
        await file.writeAsBytes(Uint8List.fromList(response.data));
        ImageGallerySaver.saveFile(file.path);
        Fluttertoast.showToast(msg: "Image Downloaded Successfully", toastLength: Toast.LENGTH_LONG, timeInSecForIosWeb: 1);
        _onLoadExit(true);
      } catch (e)
      {
        print("Error saving image: $e");
        _onLoadExit(true);
      }
    }
  }


  void _onLoad(bool showBox)
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Colors.white,
            children: [
              Row(
                children: [
                  SizedBox(width: 15),
                  CircularProgressIndicator(),
                  SizedBox(width: 17),
                  Text("Downloading...",style: TextStyle(fontSize: 15, letterSpacing: 1,color: Colors.brown)),
                ],
              ),
            ],
          );
        }
    );
  }

  void _onLoadExit(bool exitBox)
  {
    if(exitBox){
      Future.delayed(const Duration(milliseconds: 1),()
      {
        Navigator.pop(context);
      });
    }
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              widget.photo.url!,
              height: 300.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              widget.photo.title!,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16.0),

            ElevatedButton
              (
                style: ButtonStyle
                  (
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  minimumSize: MaterialStateProperty.all(Size(250, 50)),
                  elevation: MaterialStateProperty.all(4.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>
                    (
                    RoundedRectangleBorder
                      (
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                onPressed: ()
                {
                  _save(widget.photo.url);
                }, child: Text("Download", style: TextStyle(color: Colors.deepPurple),)),

            SizedBox(height: 20),
            /*ElevatedButton
              (
                style: ButtonStyle
                  (
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  minimumSize: MaterialStateProperty.all(Size(250, 50)),
                  elevation: MaterialStateProperty.all(4.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>
                    (
                    RoundedRectangleBorder
                      (
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                onPressed: ()
                {
                  var file;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewDownloadedImageScreen(savePath: file.path)));
                }, child: Text("View Downloaded", style: TextStyle(color: Colors.deepPurple),))*/
          ],
        ),
      ),
    );
  }
}