import 'package:equatable/equatable.dart';

import 'channel_model.dart';

abstract class ChannelState extends Equatable {
  ChannelState([List props = const []]) : super(props);
}

class ChannelUninitialized extends ChannelState {
  @override
  String toString() => 'ChannelUninitialized';
}

class ChannelError extends ChannelState {
  @override
  String toString() => 'ChannelError';
}

class ChannelLoaded extends ChannelState {
  final List<ChannelModel> channels;
  final bool hasReachedMax;

  ChannelLoaded({
    this.channels,
    this.hasReachedMax,
  }) : super([channels, hasReachedMax]);

  ChannelLoaded copyWith({
    List<ChannelModel> channels,
    bool hasReachedMax,
  }) {
    return ChannelLoaded(
      channels: channels ?? this.channels,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() =>
      'PostLoaded { posts: ${channels.length}, hasReachedMax: $hasReachedMax }';
}
