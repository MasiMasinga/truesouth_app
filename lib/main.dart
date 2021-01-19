import 'package:flutter/material.dart';
import 'file:///C:/Users/Public/Flutter/truesouth_app/lib/pages/home/home.dart';
import 'file:///C:/Users/Public/Flutter/truesouth_app/lib/pages/splash_screen/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TrueSouth Tech',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: SplashScreen(),
    );
  }
}

