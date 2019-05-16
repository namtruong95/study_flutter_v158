import 'package:flutter/material.dart';
import 'package:study_flutter_v158/src/constants/tab.dart';

class BuildActionAppBar extends StatelessWidget {
  final int selectedTab;

  const BuildActionAppBar({this.selectedTab}) : assert(selectedTab != null);

  Widget _buildAction(BuildContext context) {
    switch (selectedTab) {
      case tabContact:
        return Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.person_add),
              onPressed: () {
                Navigator.pushNamed(context, '/contact/create');
              },
            ),
          ],
        );
      case tabExtend:
        return Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return this._buildAction(context);
  }
}
