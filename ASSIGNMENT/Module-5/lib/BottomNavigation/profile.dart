import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
             // elevation: 4, // Add elevation here
              shape: CircleBorder(),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("assests/profile.jpg"),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nikhil Dodiya',
              style: TextStyle(color: Colors.deepPurple,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, color: Colors.deepPurple),
                SizedBox(width: 10),
                Text(
                  "Dodiyaniks@gmail.com",
                  style: TextStyle(color: Colors.deepPurple,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Add an action for editing the profile
              },
              icon: Icon(Icons.edit, color: Colors.deepPurple),
              label: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Button color
                onPrimary: Colors.deepPurple, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Bio: Flutter Developer',
              style: TextStyle(color: Colors.deepPurple,
                fontSize: 18,
              ),
            ),
            Text(
              'Location: Rajkot, Gujarat',
              style: TextStyle(color: Colors.deepPurple,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}