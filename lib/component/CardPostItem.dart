import 'package:flutter/material.dart';

class CardPostItem extends StatelessWidget {
  final String titre;
  final String auteur;
  final String avatarAuteur;
  final String image;
  final String contenu;
  final String date;

  CardPostItem(
      {this.auteur,
      this.avatarAuteur,
      this.titre,
      this.contenu,
      this.image,
      this.date});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            //entete
            ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(avatarAuteur),
              ),
              title: Text(
                auteur,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
              ),
              subtitle: Text(date),
            ),
            Container(
              child: Text(
                titre,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.0),
              ),
              alignment: Alignment.topLeft,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Image(
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(image)),
            ),
            Container(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  contenu,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.justify,
                )),
          ],
        ),
      ),
    );
  }
}
