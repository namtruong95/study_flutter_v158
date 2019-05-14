import 'package:flutter/material.dart';
import 'package:study_flutter_v158/src/components/channel/channel_model.dart';

class ChannelDetail extends StatelessWidget {
  final ChannelModel channel;

  const ChannelDetail({this.channel}) : assert(channel != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.channel.name),
      ),
      body: Center(
        child: Text(
          this.channel.imagePath,
        ),
      ),
    );
  }
}
