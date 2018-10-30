import 'package:flutter/material.dart';
import 'package:jikinge/MainPage.dart';

void main() => runApp(new EbolaApp());

class EbolaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primarySwatch: Colors.deepOrange
      ),

      home: MainPage(),
    );
  }
}


