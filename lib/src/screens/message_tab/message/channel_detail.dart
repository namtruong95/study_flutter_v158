import 'package:flutter/material.dart';
import 'package:study_flutter_v158/src/components/channel/channel_model.dart';
import 'package:study_flutter_v158/src/screens/message_tab/message/message_form.dart';
import 'package:study_flutter_v158/src/screens/message_tab/message/message_list.dart';

class ChannelDetail extends StatelessWidget {
  final ChannelModel channel;

  const ChannelDetail({this.channel}) : assert(channel != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.channel.name),
        ),
        body: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(196, 207, 208, 0.41)),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: MessageList(channel: this.channel),
              ),
              MessageForm()
            ],
          ),
        ));
  }
}
