import 'package:flutter/cupertino.dart';

class MenuItem {
  final String id;
  final String title;
  final IconData icon;

  MenuItem({
    @required this.id,
    @required this.title,
    this.icon,
  });
}
