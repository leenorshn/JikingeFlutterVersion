import 'package:flutter/material.dart';

class SuggestionPage extends StatefulWidget {
  @override
  _SuggestionPageState createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Text(
        "Suggestions",
        style: TextStyle(fontSize: 25.0),
      ),
    );
  }
}
