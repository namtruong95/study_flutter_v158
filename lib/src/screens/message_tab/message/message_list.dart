import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/channel/channel_model.dart';
import 'package:study_flutter_v158/src/components/message/message.dart';
import 'package:study_flutter_v158/src/screens/message_tab/message/my_message.dart';
import 'package:study_flutter_v158/src/screens/message_tab/message/other_message.dart';
import 'package:study_flutter_v158/src/shared/widgets/bottom_loader.dart';

class MessageList extends StatefulWidget {
  final ChannelModel channel;

  const MessageList({Key key, this.channel}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  dynamic _messageBloc;

  _MessageListState() {
    this._scrollController.addListener(_onScroll);
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildState(MessageState state) {
    if (state is MessageUninitialized) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is MessageError) {
      return Center(
        child: Text('failed to fetch messages'),
      );
    }

    if (state is MessageLoaded) {
      if (state.messages.isEmpty) {
        return Center(
          child: Text('no message'),
        );
      }

      return Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return index >= state.messages.length
                ? BottomLoader()
                : state.messages[index].isCurrentUser
                    ? MyMessage(
                        message: state.messages[index],
                      )
                    : OtherMessage(message: state.messages[index]);
          },
          itemCount: state.hasReachedMax
              ? state.messages.length
              : state.messages.length + 1,
          controller: _scrollController,
          reverse: true,
        ),
      );
    }

    return null;
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      this._messageBloc.dispatch(FetchMessage());
    }
  }

  @override
  Widget build(BuildContext context) {
    this._messageBloc = BlocProvider.of(context);

    return this._buildState((_messageBloc as MessageBloc).currentState);
  }
}
