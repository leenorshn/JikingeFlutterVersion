import 'package:flutter/material.dart';
import 'package:jikinge/component/CardConseilItem.dart';
import 'package:jikinge/models/Conseil.dart';


class ConseilPage extends StatefulWidget {
  @override
  _ConseilPageState createState() => _ConseilPageState();
}

class _ConseilPageState extends State<ConseilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: itemConseil.length,
          itemBuilder: (BuildContext context,int index){
           return CardConseilItem(
             titre: itemConseil[index].titre,
             conseil: itemConseil[index].conseil,
             date: itemConseil[index].date,
           );

          }
      ),
    );
  }
}
