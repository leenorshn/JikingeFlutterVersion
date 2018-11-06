import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostScreenPage extends StatefulWidget {
  @override
  _PostScreenPageState createState() => _PostScreenPageState();
}

class _PostScreenPageState extends State<PostScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Publier Post"),
      ),
    );
  }
}
