import 'package:flutter/material.dart';

import 'service_item.dart';

class ServiceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        margin: EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: ServiceItem(
                    icon: Icon(
                      Icons.near_me,
                      color: Colors.orange,
                    ),
                    text: 'Nearby',
                  ),
                ),
                Container(
                  child: ServiceItem(
                    icon: Icon(
                      Icons.message,
                      color: Colors.yellow,
                    ),
                    text: 'Chat rooms',
                  ),
                ),
                Container(
                  child: ServiceItem(
                    icon: Icon(
                      Icons.shop,
                      color: Colors.green,
                    ),
                    text: 'Shop',
                  ),
                ),
                Container(
                  child: ServiceItem(
                    icon: Icon(
                      Icons.tag_faces,
                      color: Colors.red,
                    ),
                    text: 'Sticker',
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: ServiceItem(
                    icon: Icon(
                      Icons.games,
                      color: Colors.blue,
                    ),
                    text: 'Game',
                  ),
                ),
                Container(
                  child: ServiceItem(
                    icon: Icon(
                      Icons.save,
                      color: Colors.blueAccent,
                    ),
                    text: 'Channel',
                  ),
                ),
                Container(
                  child: ServiceItem(
                    icon: Icon(
                      Icons.near_me,
                      color: Colors.lightGreen,
                    ),
                    text: 'eGovenm...',
                  ),
                ),
                Container(
                  child: ServiceItem(
                    icon: Icon(
                      Icons.money_off,
                      color: Colors.redAccent,
                    ),
                    text: 'Bank',
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
