import 'package:equatable/equatable.dart';

import 'message_model.dart';

abstract class MessageState extends Equatable {
  MessageState([List props = const []]) : super(props);
}

class MessageUninitialized extends MessageState {
  @override
  String toString() => 'MessageUninitialized';
}

class MessageError extends MessageState {
  @override
  String toString() => 'MessageError';
}

class MessageLoaded extends MessageState {
  final List<MessageModel> messages;
  final bool hasReachedMax;

  MessageLoaded({
    this.messages,
    this.hasReachedMax,
  }) : super([
          messages,
          hasReachedMax,
        ]);

  MessageLoaded copyWith({
    List<MessageModel> messages,
    bool hasReachedMax,
  }) {
    return MessageLoaded(
        messages: messages ?? this.messages,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  String toString() =>
      'PostLoaded { posts: ${this.messages.length}, hasReachedMax: $hasReachedMax }';
}
