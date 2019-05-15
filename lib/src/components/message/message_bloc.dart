import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter_v158/src/components/channel/channel_model.dart';
import 'package:study_flutter_v158/src/repositories/message_repository.dart';
import 'message.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageRepository messageRepo = new MessageRepository();
  final ChannelModel channel;

  MessageBloc({@required this.channel});
  @override
  MessageState get initialState => MessageUninitialized();

  @override
  Stream<MessageState> mapEventToState(
    MessageEvent event,
  ) async* {
    if (event is FetchMessage && !this._hasNextPage(currentState)) {
      try {
        if (currentState is MessageUninitialized) {
          final messages = await messageRepo.fetchMessages(this.channel.id);

          yield MessageLoaded(messages: messages, hasReachedMax: false);
          return;
        }

        if (currentState is MessageLoaded) {
          final messages = await messageRepo.fetchMessages(this.channel.id);

          yield messages.isEmpty
              ? (currentState as MessageLoaded).copyWith(hasReachedMax: true)
              : MessageLoaded(
                  messages: (currentState as MessageLoaded).messages + messages,
                  hasReachedMax: true,
                );
        }
      } catch (e) {
        yield MessageError();
      }

      return;
    }

    if (event is AddMessage) {
      if (currentState is MessageLoaded) {
        yield MessageLoaded(
            messages:
                [event.message] + (currentState as MessageLoaded).messages,
            hasReachedMax: (currentState as MessageLoaded).hasReachedMax);
      }
      return;
    }
  }

  bool _hasNextPage(MessageState state) =>
      state is MessageLoaded && state.hasReachedMax;
}
