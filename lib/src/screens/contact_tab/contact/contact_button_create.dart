import 'package:flutter/material.dart';

class ContactButtonCreate extends StatelessWidget {
  Widget _buildButtonCreate(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/contact/create');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: 70,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            child: this._buildButtonCreate(context),
          );
        },
        childCount: 1,
      ),
    );
  }
}
