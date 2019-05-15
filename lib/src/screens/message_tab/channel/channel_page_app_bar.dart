import 'package:flutter/material.dart';

class ChannelPageAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      expandedHeight: 50,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Container(
        alignment: Alignment.center,
        child: DefaultTabController(
          length: 2,
          child: TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.blue,
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
            ],
          ),
        ),
      ),
    );
  }
}
