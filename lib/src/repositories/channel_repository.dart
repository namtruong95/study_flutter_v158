import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:study_flutter_v158/src/components/channel/channel_model.dart';

class ChannelRepository {
  static final ChannelRepository _channelRepository =
      new ChannelRepository._internal();
  factory ChannelRepository() => _channelRepository;
  ChannelRepository._internal();

  FutureOr<List<ChannelModel>> fetchChannels() async {
    final JsonDecoder _decoder = new JsonDecoder();

    final res =
        await rootBundle.loadString('lib/assets/mock_data/channels.json');
    await Future.delayed(Duration(milliseconds: 1000));
    final json = _decoder.convert(res);

    return (json['data'] as List)
        .map((item) => ChannelModel.fromMap(item))
        .toList();
  }
}
