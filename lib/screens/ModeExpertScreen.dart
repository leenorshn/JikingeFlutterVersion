import 'package:flutter/material.dart';
import 'package:jikinge/pages/ChatsPage.dart';
import 'package:jikinge/pages/StatUserPage.dart';
import 'package:jikinge/pages/SuggestionPage.dart';

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
}
