import 'package:flutter/material.dart';

class ProfileSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            'SETTINGS',
            style: TextStyle(color: Theme
                .of(context)
                .primaryColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Text("Profile Settings"),
        )
    );
  }
}

