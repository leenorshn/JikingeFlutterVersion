import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jikinge/screens/ModeExpertScreen.dart';

class SecretCode extends StatefulWidget {
  @override
  _SecretCodeState createState() => _SecretCodeState();
}

class _SecretCodeState extends State<SecretCode> {
  GlobalKey _key=new GlobalKey<FormState>();
  int _secretMot=1234;

  void _validAndSubmit(){
    if( _secretMot==1234){
      Route route=CupertinoPageRoute(builder: (context)=>ExpertScreen());
      Navigator.of(context).pushReplacement(route);
    }else{
      print("mode expert erreur code");
    }
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text("Secret code"),
      ),
      body: Center(
        child: Form(
          key: _key,
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 100.0,),
               Container(
                 width: 200.0,
                 child: new TextFormField(
                   textAlign: TextAlign.center,
                   obscureText: true,
                   onSaved: (value)=>_secretMot=int.parse(value),
                   decoration: InputDecoration(labelText: "Code SMS",
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(30.0),)),
                   

                 ),
               ),
                RaisedButton(
                    onPressed:_validAndSubmit,
                    child: Text("Valider",style: TextStyle(color: Colors.white),),
                  color: Colors.green,
                )
              ],
            ),
          ),
        ),
      ),
    );



  }

}
