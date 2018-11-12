import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostDetail extends StatefulWidget {
  final DocumentSnapshot post;

  PostDetail({this.post});

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {

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
        title: Text("Post Detail"),
      ),
      body: Container(
          child: ListView(
            children: <Widget>[
              Image.network(widget.post.data["image"]),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.post.data["contenu"],
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              Container(
                color: Colors.lightBlue,
                child: SizedBox(
                  height: 30.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    child: Text(
                      "Commentaire",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
