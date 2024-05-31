import 'package:flutter/material.dart';
import 'package:meme_app/view/mainScreen.dart';
import 'package:meme_app/view/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Meme App',
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}
