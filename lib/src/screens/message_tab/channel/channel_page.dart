import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/channel/channel.dart';
import 'package:study_flutter_v158/src/screens/message_tab/channel/channel_list.dart';

import 'active_user/active_user_list.dart';

class ChannelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  ChannelBloc _channelBloc;

  @override
  void initState() {
    this._scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    this._scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      this._channelBloc.dispatch(FetchChannel());
    }
  }

  @override
  Widget build(BuildContext context) {
    this._channelBloc = BlocProvider.of<ChannelBloc>(context);
    this._channelBloc.dispatch(FetchChannel());

    return BlocBuilder<ChannelEvent, ChannelState>(
      bloc: this._channelBloc,
      builder: (BuildContext context, ChannelState state) {
        return CustomScrollView(
          slivers: <Widget>[
            ActiveUserList(),
            ChannelList(),
          ],
          controller: this._scrollController,
        );
      },
    );
  }
}
