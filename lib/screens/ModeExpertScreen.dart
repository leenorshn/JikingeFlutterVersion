import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jikinge/pages/ChatsPage.dart';
import 'package:jikinge/pages/StatUserPage.dart';
import 'package:jikinge/pages/SuggestionPage.dart';
import 'package:jikinge/screens/ConseilScreenPage.dart';
import 'package:jikinge/screens/PostScreenPage.dart';
import 'package:jikinge/screens/StatistiqueScreen.dart';
import 'package:jikinge/utils/Constants.dart';

class ExpertScreen extends StatefulWidget {
  @override
  _ExpertScreenState createState() => _ExpertScreenState();
}

class _ExpertScreenState extends State<ExpertScreen>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mode Expert"),
        bottom: TabBar(
            controller: _tabController,
            tabs: [
              new Tab(text: "chats",),
              new Tab(text: "Suggest",),
              new Tab(text: "Usage",)
            ]),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.expertChoices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          new ChatsPage(),
          new SuggestionPage(),
          new StatUserPage(),
        ],
      ),
    );
  }

  void choiceAction(String choice) {
    if (choice == Constants.Post) {
      // mover de l'ecran principale vers le ModeExpert
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => StatistiqueScreen()));
      print('Mode expert');
    } else if (choice == Constants.Conseil) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ConseilScreenPage()));
      print('Subscribe');
    } else if (choice == Constants.Statistique) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PostScreenPage()));
      print('Subscribe');
    }
  }
}
