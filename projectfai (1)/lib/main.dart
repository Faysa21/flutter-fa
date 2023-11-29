import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyImageDisplay(),
    );
  }
}

class MyImageDisplay extends StatefulWidget {
  @override
  _MyImageDisplayState createState() => _MyImageDisplayState();
}

class _MyImageDisplayState extends State<MyImageDisplay> {
  List<String> images = [
    'images/1.jpeg',
    'images/2.jpeg',
    'images/3.jpeg',
    'images/4.jpeg',
    'images/5.jpeg',
  ];
  int currentIndex = 0;

  void changeImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
      if (currentIndex == 0) {
        // Reset to the first image when reaching the last one
        images.shuffle();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Viewer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              images[currentIndex],
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: changeImage,
              child: Text('Change Image'),
            ),
          ],
        ),
      ),
    );
  }
}
