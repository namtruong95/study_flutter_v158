import 'package:flutter/material.dart';
import 'package:study_flutter_v158/src/components/message/message_model.dart';
import 'package:study_flutter_v158/src/constants/colors.dart';

class MyMessage extends StatelessWidget {
  final MessageModel message;

  const MyMessage({@required this.message}) : assert(message != null);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.fromLTRB(80, 0, 0, 0),
        decoration: BoxDecoration(
          color: blue_2,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                this.message.message,
                textAlign: TextAlign.right,
              ),
              Container(
                child: Text(
                  message.time,
                  style: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.left,
                ),
                margin: EdgeInsets.only(top: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
