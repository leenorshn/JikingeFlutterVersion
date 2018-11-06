import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const String _name = "victor";

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});

  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return new SizeTransition( //new
        sizeFactor: new CurvedAnimation( //new
            parent: animationController, curve: Curves.easeOut), //new
        axisAlignment: 0.0, //new
        child: new Container( //modified
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: new CircleAvatar(child: new Text(_name[0])),
              ),
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(_name, style: Theme
                        .of(context)
                        .textTheme
                        .subhead),
                    new Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: new Text(text),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ) //new
    );
  }
}


class ChatsPage extends StatefulWidget {
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> with TickerProviderStateMixin {


  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

  // Modify the _buildTextComposer method with the code below
// to add the onChanged() and onPressed() callbacks.

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme
          .of(context)
          .accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onChanged: (String text) { //new
                  setState(() { //new
                    _isComposing = text.length > 0; //new
                  }); //new
                }, //new
                onSubmitted: _handleSubmitted,
                decoration:
                new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: Theme
                  .of(context)
                  .platform == TargetPlatform.iOS ? //modified
              new CupertinoButton( //new
                child: new Text("Send"), //new
                onPressed: _isComposing //new
                    ? () => _handleSubmitted(_textController.text) //new
                    : null,) :
              new IconButton(
                icon: new Icon(Icons.send),
                onPressed: _isComposing
                    ? () => _handleSubmitted(_textController.text) //modified
                    : null, //modified
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Modify the _handleSubmittted method definition as follows.

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() { //new
      _isComposing = false; //new
    }); //new
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }


  @override
  void dispose() {
    //new
    for (ChatMessage message in _messages) //new
      message.animationController.dispose(); //new
    super.dispose(); //new
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container( //modified
          child: new Column( //modified
            children: <Widget>[
              new Flexible(
                child: new ListView.builder(
                  padding: new EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (_, int index) => _messages[index],
                  itemCount: _messages.length,
                ),
              ),
              new Divider(height: 1.0),
              new Container(
                decoration: new BoxDecoration(color: Theme
                    .of(context)
                    .cardColor),
                child: _buildTextComposer(),
              ),
            ],
          ),
          decoration: Theme
              .of(context)
              .platform == TargetPlatform.iOS //new
              ? new BoxDecoration( //new
            border: new Border( //new
              top: new BorderSide(color: Colors.grey[200]), //new
            ), //new
          ) //new
              : null), //modified
    );
  }

}
