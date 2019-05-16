import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/message/message.dart';
import 'package:study_flutter_v158/src/components/message/message_model.dart';
import 'package:study_flutter_v158/src/constants/colors.dart';

class MessageForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MessageFormState();
}

class _MessageFormState extends State<MessageForm> {
  final TextEditingController message = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final _messageBloc = BlocProvider.of<MessageBloc>(context);

    return Container(
      child: Row(
        children: <Widget>[
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              child: IconButton(
                icon: Icon(Icons.image),
                onPressed: () {},
                color: gray_1,
              ),
            ),
            color: Colors.white,
          ),
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              child: IconButton(
                icon: Icon(Icons.tag_faces),
                onPressed: () {
                  print('get sticker');
                },
                color: gray_1,
              ),
            ),
            color: Colors.white,
          ),
          Flexible(
            child: Container(
              child: TextField(
                controller: this.message,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(
                    color: gray_1,
                  ),
                ),
                focusNode: focusNode,
              ),
            ),
          ),
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  if (this.message.text.length == 0) {
                    return;
                  }

                  final message = MessageModel(
                    id: 9999,
                    message: this.message.text,
                    isCurrentUser: true,
                    time: DateFormat('HH:mm').format(DateTime.now()),
                  );
                  _messageBloc.dispatch(AddMessage(message: message));

                  this.message.clear();
                },
                color: gray_1,
              ),
            ),
            color: Colors.white,
          )
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: pink_1,
            width: 0.5,
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}
