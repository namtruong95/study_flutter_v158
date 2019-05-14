import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/channel/channel.dart';
import 'package:study_flutter_v158/src/screens/message_tab/channel/channel_item.dart';
import 'package:study_flutter_v158/src/shared/widgets/bottom_loader.dart';

class ChannelList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChannelListState();
}

class _ChannelListState extends State<ChannelList> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  ChannelBloc _channelBloc;

  _ChannelListState() {
    this._scrollController.addListener(_onScroll);
  }
  @override
  void initState() {
    this._channelBloc = ChannelBloc();
    this._channelBloc.dispatch(FetchChannel());
    super.initState();
  }

  @override
  void dispose() {
    this._channelBloc.dispose();
    super.dispose();
  }

  Widget _buildState(ChannelState state) {
    if (state is ChannelUninitialized) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is ChannelError) {
      return Center(
        child: Text('failed to fetch channels'),
      );
    }

    if (state is ChannelLoaded) {
      if (state.channels.isEmpty) {
        return Center(
          child: Text('no channel'),
        );
      }
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return index >= state.channels.length
              ? BottomLoader()
              : ChannelItem(channel: state.channels[index], index: index);
        },
        itemCount: state.hasReachedMax
            ? state.channels.length
            : state.channels.length + 1,
        controller: _scrollController,
      );
    }

    return null;
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
    return BlocBuilder(
      bloc: this._channelBloc,
      builder: (BuildContext context, ChannelState state) {
        return this._buildState(state);
      },
    );
  }
}
