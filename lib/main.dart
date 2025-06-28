import 'package:flutter/material.dart';
import 'package:javettieri/splash_screen.dart';

void main() {
  runApp(JavettieriApp());
}

class JavettieriApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Javettieri',
      theme: ThemeData.light(),
      home: SplashScreen(),
    );
  }
}
