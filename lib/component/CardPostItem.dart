import 'package:flutter/material.dart';

class CardPostItem extends StatelessWidget {
  final String image;
  final String contenu;
  final String date;

  CardPostItem({
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

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Image.network(
                  image,
                  fit: BoxFit.fitWidth,
                  height: 250.0,
                )
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
