import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddSuggestionScreen extends StatefulWidget {
  @override
  _AddSuggestionScreenState createState() => _AddSuggestionScreenState();
}

class _AddSuggestionScreenState extends State<AddSuggestionScreen> {
  String _titre;
  String _suggestion;

  void _soumettre() {}


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey _key = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: Text("Suggestion"),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Votre suggestion sera traiter par l'equipe d'Ebola",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Form(
              key: _key,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onSaved: (value) => _titre = value,
                    decoration: InputDecoration(
                        labelText: "titre",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    onSaved: (value) => _titre = value,
                    decoration: InputDecoration(
                        labelText: "titre",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    onSaved: (value) => _titre = value,
                    decoration: InputDecoration(
                        labelText: "suggestion",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                  SizedBox(height: 24.0,),
                  RaisedButton(
                      shape: StadiumBorder(),
                      splashColor: Colors.deepOrange,
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        child: Text(
                          "Soumettre",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      onPressed: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
