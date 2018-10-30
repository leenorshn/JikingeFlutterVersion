import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jikinge/screens/VerifyScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login "),
      ),
      body: ListView(children: <Widget>[

        new Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                      "Creer un compte en entrant votre numeno de telephone, nous vos enverons un sms de verification ",
                    style: TextStyle(fontSize: 18.0,),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 16.0,),
                Container(
                  child: TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.phone,
                    onSaved: (v)=>_phone=v,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_android),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                        labelText: "phone number"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:16.0),
                  child: Material(
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: (){
                        Route verifCode=CupertinoPageRoute(builder: (context)=>VerifyScreen());
                        Navigator.of(context).push(verifCode);
                      },
                      child: Container(
                        width: 230.0,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration( color:Colors.green,borderRadius: BorderRadius.circular(30.0)),
                        child:Text("Verify for stating",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],),
    );
  }
}
