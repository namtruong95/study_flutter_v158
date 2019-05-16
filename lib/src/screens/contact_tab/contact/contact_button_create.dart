import 'package:flutter/material.dart';

class ContactButtonCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/contact/create');
      },
      child: Icon(Icons.add),
    );
  }
}
