import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/channel/channel.dart';
import 'package:study_flutter_v158/src/screens/message_tab/channel/channel_list.dart';

import 'channel_page_app_bar.dart';

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
    this._channelBloc = ChannelBloc();
    this._channelBloc.dispatch(FetchChannel());

    super.initState();
  }

  @override
  void dispose() {
    this._scrollController.dispose();
    this._channelBloc.dispose();
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
    return BlocProviderTree(
      blocProviders: [
        BlocProvider(
          bloc: this._channelBloc,
        )
      ],
      child: BlocBuilder<ChannelEvent, ChannelState>(
        bloc: this._channelBloc,
        builder: (BuildContext context, ChannelState state) {
          return CustomScrollView(
            slivers: <Widget>[
              ChannelPageAppBar(),
              ChannelList(),
            ],
            controller: this._scrollController,
          );
        },
      ),
    );
  }
}
