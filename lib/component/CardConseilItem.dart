import 'package:flutter/material.dart';

class CardConseilItem extends StatelessWidget {

  final String titre;
  final String conseil;
  final String date;

  CardConseilItem({this.conseil,this.titre,this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      child:new Container(
        padding: EdgeInsets.all(8.0),
        child:new Column(
          children: <Widget>[
          new  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(titre,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w700),),
                Text(date,style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w400,color: Colors.grey))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(conseil),
            )
          ],
        ),
      ),
    );
  }
}
