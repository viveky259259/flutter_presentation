import 'package:animated_website/pages/presentation_intro.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PresentationIntroPage(),
    );
  }
}
