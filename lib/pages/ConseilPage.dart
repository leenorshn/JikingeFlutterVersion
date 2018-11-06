import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jikinge/utils/SmartLoader.dart';

class ConseilPage extends StatefulWidget {
  @override
  _ConseilPageState createState() => _ConseilPageState();
}

class _ConseilPageState extends State<ConseilPage> {
  Future _data;

  @override
  void initState() {
    super.initState();
    _data = getConseil();
  }

  Future getConseil() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("conseil").getDocuments();

    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot ds) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ConseilDetail(
                  post: ds,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
            future: _data,
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: SmartLoader());
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                            snapshot.data[index].data["titre"],
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.justify,
                          ),
                          subtitle: Text(
                            "${snapshot.data[index].data["contenu"].substring(
                                0, 60)} ...",
                            style:
                            TextStyle(fontSize: 16.0, color: Colors.grey),
                            textAlign: TextAlign.justify,
                          ),
                          onTap: () => navigateToDetail(snapshot.data[index]),
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}

// detaile du conseil

class ConseilDetail extends StatefulWidget {
  final DocumentSnapshot post;

  ConseilDetail({this.post});

  @override
  _ConseilDetailState createState() => _ConseilDetailState();
}

class _ConseilDetailState extends State<ConseilDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.post.data["titre"]),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.post.data["contenu"],
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ));
  }
}
