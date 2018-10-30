import 'package:flutter/material.dart';

class AddSuggestionScreen extends StatefulWidget {
  @override
  _AddSuggestionScreenState createState() => _AddSuggestionScreenState();
}

class _AddSuggestionScreenState extends State<AddSuggestionScreen> {
  String _titre;
  String _suggestion;

  void _soumettre(){}
  @override
  Widget build(BuildContext context) {
    GlobalKey _key=GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: Text("Suggestion"),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            child: Text("Votre suggestion sera traiter par l'equipe d'Ebola"),
          ),
          new Card(
            child: Container(
              child: Form(
                key: _key,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onSaved: (value)=>_titre=value,
                      decoration: InputDecoration(
                        labelText: "titre",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                      ),
                    ) ,
                    TextFormField(
                      onSaved: (value)=>_titre=value,
                      decoration: InputDecoration(
                          labelText: "suggestion",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                      ),
                    ) ,

                  ],
                ),
              ),
            ),
          ),
          RaisedButton(
            color: Colors.green,
            child: Text(
              "Soumettre"
            ),
              onPressed: (){})
        ],
      ),
    );
  }
}
