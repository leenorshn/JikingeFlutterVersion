import 'package:flutter/material.dart';
import 'package:jikinge/component/CardPostItem.dart';
import 'package:jikinge/models/Post.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listPost.length,
        itemBuilder: (BuildContext context,int index){
            return CardPostItem(
              auteur: listPost[index].auteur,
              avatarAuteur: listPost[index].avatar,
              contenu: listPost[index].contenu,
              image: listPost[index].image,
              titre: listPost[index].titre,
              date: listPost[index].date,
            );
        },
      ),
    );
  }
}
