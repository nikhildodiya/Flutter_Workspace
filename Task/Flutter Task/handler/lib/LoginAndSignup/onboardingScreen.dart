import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class OnboardingScreen extends StatelessWidget
{
  final PageController _pageController = PageController();

  final List<OnboardingPage> pages =
  [
    OnboardingPage
      (
      title: "Secure Passwords",
      description: "Keep your passwords safe and secure with our password manager.",
      image: "assets/pasword.png",
    ),
    OnboardingPage(
      title: "Organize Your Data",
      description: "Effortlessly organize your passwords and personal information.",
      image: "assets/organize_data.png",
    ),
    OnboardingPage(
      title: "Sync Across Devices",
      description: "Access your passwords and data from anywhere with seamless synchronization.",
      image: "assets/sync_devices.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        itemBuilder: (context, index)
        {
          return pages[index];
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              _pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Text("Back"),
          ),
          TextButton(
            onPressed: () {
              if (_pageController.page == pages.length - 1)
              {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login()));
              } else {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Text(_pageController.page == pages.length - 1 ? "Finish" : "Next"),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  OnboardingPage({required this.title, required this.description, required this.image});

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column
        (
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          Image.asset
          (
            image,
            height: 200,
          ),
          SizedBox(height: 24.0),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}