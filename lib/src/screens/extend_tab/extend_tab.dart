import 'package:flutter/material.dart';

import 'profile/profile.dart';

import 'service/service_list.dart';

class ExtendTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Profile(),
                ServiceList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
