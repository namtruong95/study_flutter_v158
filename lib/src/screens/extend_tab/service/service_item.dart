import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ServiceItem extends StatelessWidget {
  final Icon icon;
  final String text;

  const ServiceItem({this.icon, this.text})
      : assert(icon != null),
        assert(text != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: icon,
          ),
          Text(text)
        ],
      ),
    );
  }
}
