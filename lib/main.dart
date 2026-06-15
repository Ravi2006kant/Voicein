import 'package:flutter/material.dart';
import 'package:voicein/pages/voice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Voice(), debugShowCheckedModeBanner: false);
  }
}
