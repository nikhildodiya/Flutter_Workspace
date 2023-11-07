// 75. Create an Android Application which Manage Activity Lifecycle Stages and Showing Toast with Performing Different Stages.

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(),
  debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget
{
  @override
  _ActivityLifecycleDemoState createState() => _ActivityLifecycleDemoState();
}

class _ActivityLifecycleDemoState extends State<MyApp>
{
  @override
  void initState()
  {
    super.initState();
    showToast('onCreate');
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity Lifecycle Demo'),
      ),
      body: Center(
        child: Text('Activity Lifecycle Stages'),
      ),
    );
  }

  @override
  void didChangeDependencies()
  {
    super.didChangeDependencies();
    showToast('onStart');
  }

  @override
  void didUpdateWidget(covariant MyApp oldWidget)
  {
    super.didUpdateWidget(oldWidget);
    showToast('onResume');
  }

  @override
  void deactivate()
  {
    super.deactivate();
    showToast('onPause');
  }

  @override
  void dispose()
  {
    super.dispose();
    showToast('onDestroy');
  }

  void showToast(String message)
  {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
    );
  }
}