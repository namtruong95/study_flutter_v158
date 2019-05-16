import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/auth/auth.dart';
import 'package:study_flutter_v158/src/constants/menu_header.dart';
import 'package:study_flutter_v158/src/screens/layouts/app_bar/build_action.dart';
import 'menu_item.model.dart';

class LayoutAppBar extends StatelessWidget {
  final String title;
  final int selectedTab;

  final List<MenuItem> menus = [
    MenuItem(
      id: MenuHeader.LOGOUT,
      title: MenuHeader.LOGOUT,
      icon: Icons.lock_open,
    ),
  ];

  LayoutAppBar({
    @required this.title,
    @required this.selectedTab,
  })  : assert(title != null),
        assert(selectedTab != null);

  @override
  Widget build(BuildContext context) {
    final _authBloc = BlocProvider.of<AuthBloc>(context);

    return AppBar(
      elevation: 0.0,
      title: Text(title),
      actions: <Widget>[
        BuildActionAppBar(
          selectedTab: this.selectedTab,
        ),
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            Navigator.pushNamed(context, '/notification');
          },
        ),
        PopupMenuButton(
          onSelected: (MenuItem menuItem) {
            switch (menuItem.id) {
              case MenuHeader.LOGOUT:
                _authBloc.dispatch(LoggedOut());

                break;
            }
          },
          itemBuilder: (BuildContext context) {
            return menus.map((MenuItem menuItem) {
              return PopupMenuItem<MenuItem>(
                value: menuItem,
                child: new Row(
                  children: <Widget>[
                    Icon(Icons.lock_open),
                    Text(menuItem.title)
                  ],
                ),
              );
            }).toList();
          },
        )
      ],
    );
  }
}
