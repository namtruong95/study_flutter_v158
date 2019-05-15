import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/active_user/active_user.dart';

import 'active_user_item.dart';

class ActiveUserList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ActiveUserListState();
}

class _ActiveUserListState extends State<ActiveUserList> {
  ActiveUserBloc _activeUserBloc;

  @override
  void initState() {
    _activeUserBloc = ActiveUserBloc();
    _activeUserBloc.dispatch(FetchActiveUser());
    super.initState();
  }

  @override
  void dispose() {
    _activeUserBloc.dispose();
    super.dispose();
  }

  Widget _buildActiveUserWidget(ActiveUserState state) {
    if (state is ActiveUserLoaded) {
      if (state.activeUsers.isNotEmpty) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return UserActiveItem(
              activeUser: state.activeUsers[index],
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: state.activeUsers.length,
        );
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _activeUserBloc,
      builder: (BuildContext context, ActiveUserState state) {
        return SliverFixedExtentList(
          itemExtent: 80,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xffaeaeae), width: 0.5),
                    ),
                  ),
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: this._buildActiveUserWidget(state),
                ),
              );
            },
            childCount: 1,
          ),
        );
      },
    );
  }
}
