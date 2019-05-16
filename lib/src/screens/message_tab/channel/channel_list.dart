import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/channel/channel.dart';
import 'package:study_flutter_v158/src/screens/message_tab/channel/channel_item.dart';
import 'package:study_flutter_v158/src/shared/widgets/bottom_loader.dart';

class ChannelList extends StatelessWidget {
  Widget _buildContent(ChannelState state, int index) {
    if (state is ChannelUninitialized) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is ChannelError) {
      return Center(
        child: Text('failed to fetch data'),
      );
    }

    if (state is ChannelLoaded) {
      if (state.channels.isEmpty) {
        return Center(
          child: Text('data is empty'),
        );
      }

      return index >= state.channels.length
          ? BottomLoader()
          : ChannelItem(
              channel: state.channels[index],
            );
    }

    return Container();
  }

  Widget _buildState(ChannelState state) {
    return SliverFixedExtentList(
      itemExtent: 70,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            child: this._buildContent(state, index),
          );
        },
        childCount: (state is ChannelLoaded)
            ? state.hasReachedMax
                ? state.channels.length
                : state.channels.length + 1
            : 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _channelBloc = BlocProvider.of<ChannelBloc>(context);

    return this._buildState(_channelBloc.currentState);
  }
}
