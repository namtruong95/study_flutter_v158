import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'profile_infomation.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: ProfileInformation(),
    );
  }
}
