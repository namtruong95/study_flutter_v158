import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/auth/auth.dart';
import 'package:study_flutter_v158/src/constants/menu_header.dart';
import 'menu_item.model.dart';

class LayoutAppBar extends StatelessWidget {
  final String title;

  final List<MenuItem> menus = [
    MenuItem(
      id: MenuHeader.LOGOUT,
      title: MenuHeader.LOGOUT,
      icon: Icons.lock_open,
    ),
  ];

  LayoutAppBar({
    @required this.title,
  }) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    final _authBloc = BlocProvider.of<AuthBloc>(context);

    return AppBar(
      elevation: 0.0,
      title: Center(
        child: Text(title),
      ),
      actions: <Widget>[
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
