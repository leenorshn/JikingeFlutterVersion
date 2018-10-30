import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jikinge/screens/LoginScreen.dart';
import 'package:jikinge/screens/ProfileSetting.dart';

class VerifyScreen extends StatefulWidget {
  final String phone;
  VerifyScreen({this.phone});

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  String _code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification Code"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(

          child: ListView(

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Entrez dans la zone ci-dessous le code du SMS ",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                child: TextFormField(
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  onSaved: (v) => _code = v,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.sms),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      labelText: "code"),
                ),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    color: Colors.grey.withAlpha(100),
                      onPressed: () {
                    Route verifCode=CupertinoPageRoute(builder: (context)=>LoginScreen());
                    Navigator.of(context).pushReplacement(verifCode);
                  }, child: Text("Prec")),
                  RaisedButton(
                    onPressed: () {
                      Route verifCode=CupertinoPageRoute(builder: (context)=>ProfileSetting());
                      Navigator.of(context).pushReplacement(verifCode);
                    },
                    child: Text(
                      "Validate",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.green,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
