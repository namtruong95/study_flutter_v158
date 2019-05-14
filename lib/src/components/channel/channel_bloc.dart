import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:study_flutter_v158/src/repositories/channel_repository.dart';
import 'channel.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  final ChannelRepository channelRepo = new ChannelRepository();

  @override
  ChannelState get initialState => ChannelUninitialized();

  @override
  Stream<ChannelState> mapEventToState(
    ChannelEvent event,
  ) async* {
    if (event is FetchChannel && !this._hasNextPage(currentState)) {
      try {
        if (currentState is ChannelUninitialized) {
          final channels = await channelRepo.fetchChannels();

          yield ChannelLoaded(channels: channels, hasReachedMax: false);
          return;
        }

        if (currentState is ChannelLoaded) {
          final channels = await channelRepo.fetchChannels();

          yield channels.isEmpty
              ? (currentState as ChannelLoaded).copyWith(hasReachedMax: true)
              : ChannelLoaded(
                  channels: (currentState as ChannelLoaded).channels + channels,
                  hasReachedMax: true,
                );
        }
      } catch (e) {
        yield ChannelError();
      }
    }
  }

  bool _hasNextPage(ChannelState state) =>
      state is ChannelLoaded && state.hasReachedMax;
}
