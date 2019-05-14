import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:study_flutter_v158/src/components/message/message_model.dart';

class MessageRepository {
  static final MessageRepository _messageRepository =
      new MessageRepository._internal();
  factory MessageRepository() => _messageRepository;
  MessageRepository._internal();

  FutureOr<List<MessageModel>> fetchMessages(int channelId) async {
    final JsonDecoder _decoder = new JsonDecoder();

    final res =
        await rootBundle.loadString('lib/assets/mock_data/messages.json');
    await Future.delayed(Duration(milliseconds: 1000));
    final json = _decoder.convert(res);

    return (json['data'] as List)
        .map((item) => MessageModel.fromMap(item))
        .toList();
  }
}
