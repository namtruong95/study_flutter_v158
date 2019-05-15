import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/channel/channel_model.dart';
import 'package:study_flutter_v158/src/components/message/message.dart';
import 'package:study_flutter_v158/src/screens/message_tab/message/message_form.dart';
import 'package:study_flutter_v158/src/screens/message_tab/message/message_list.dart';

class ChannelDetail extends StatefulWidget {
  final ChannelModel channel;

  const ChannelDetail({this.channel}) : assert(channel != null);

  @override
  State<StatefulWidget> createState() => _ChannelDetailState();
}

class _ChannelDetailState extends State<ChannelDetail> {
  MessageBloc _messageBloc;

  @override
  void initState() {
    _messageBloc = MessageBloc(channel: this.widget.channel);
    _messageBloc.dispatch(FetchMessage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider(
          bloc: _messageBloc,
        )
      ],
      child: BlocBuilder<MessageEvent, MessageState>(
        bloc: _messageBloc,
        builder: (BuildContext context, MessageState state) {
          return Scaffold(
              appBar: AppBar(
                title: Text(this.widget.channel.name),
              ),
              body: Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(196, 207, 208, 0.41)),
                child: Column(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: MessageList(channel: this.widget.channel),
                    ),
                    MessageForm()
                  ],
                ),
              ));
        },
      ),
    );
  }
}
