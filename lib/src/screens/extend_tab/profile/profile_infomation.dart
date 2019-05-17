import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study_flutter_v158/src/constants/colors.dart';

class ProfileInformation extends StatelessWidget {
  final String name = 'Nam 123';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Text('NA'),
            ),
            title: Text(name),
            subtitle: Text('My Profile'),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Icon(
              Icons.add_a_photo,
              color: gray_1,
            ),
          )
        ],
      ),
    );
  }
}
