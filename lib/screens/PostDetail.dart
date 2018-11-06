import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostDetail extends StatefulWidget {
  final DocumentSnapshot post;

  PostDetail({this.post});

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.data["titre"]),
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
              child: Text(
                "Commentaire",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
