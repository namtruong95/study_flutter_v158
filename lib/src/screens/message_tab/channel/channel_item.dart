import 'package:flutter/material.dart';
import 'package:study_flutter_v158/src/components/channel/channel_model.dart';
import 'package:study_flutter_v158/src/screens/message_tab/message/channel_detail.dart';

class ChannelItem extends StatelessWidget {
  final ChannelModel channel;

  const ChannelItem({
    @required this.channel,
  }) : assert(channel != null);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return ChannelDetail(channel: this.channel);
        }));
      },
      leading: CircleAvatar(
        child: Text(
          this.channel.id.toString(),
        ),
      ),
      title: Text(this.channel.name),
      subtitle: Text(this.channel.imagePath),
    );
  }
}
