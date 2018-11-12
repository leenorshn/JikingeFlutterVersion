import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jikinge/screens/PostDetail.dart';
import 'package:jikinge/utils/SmartLoader.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Card(
      child: Container(
        width: double.infinity,
        child: Column(

          children: <Widget>[

            GestureDetector(
              onTap: () => navigateToPostDetail(document),
              child: Image.network(
                document["image"],
                fit: BoxFit.cover,
              ),
            ),
            // ...

            Container(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "${document["contenu"].substring(0, 25)}. ...",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.justify,
                )),
            GestureDetector(
              child: Container(
                color: Colors.grey.withAlpha(100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.comment, color: Colors.blue,),
                    FlatButton(onPressed: () {},
                        child: Text(" 0 Comments", style: TextStyle(
                            fontSize: 18.0, color: Colors.blue),)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('posts').snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: SmartLoader());
                default:
                  return new ListView.builder(
                    padding: EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return _buildListItem(
                          context, snapshot.data.documents[index]);
                    },
                  );
              }
            },
          ),
        ));
  }

  navigateToPostDetail(DocumentSnapshot document) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PostDetail(post: document,)));
  }
}
