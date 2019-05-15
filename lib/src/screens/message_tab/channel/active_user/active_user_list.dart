import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/active_user/active_user.dart';

import 'active_user_item.dart';

class ActiveUserList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ActiveUserListState();
}

class _ActiveUserListState extends State<ActiveUserList> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  ActiveUserBloc _activeUserBloc;

  @override
  void initState() {
    this._scrollController.addListener(_onScroll);

    _activeUserBloc = ActiveUserBloc();
    _activeUserBloc.dispatch(FetchActiveUser());
    super.initState();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll <= _scrollThreshold) {
      this._activeUserBloc.dispatch(FetchActiveUser());
    }
  }

  @override
  void dispose() {
    this._scrollController.dispose();
    _activeUserBloc.dispose();
    super.dispose();
  }

  Widget _buildActiveUserWidget(ActiveUserState state) {
    if (state is ActiveUserLoaded) {
      if (state.activeUsers.isNotEmpty) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return (!state.hasReachedMax && index >= state.activeUsers.length)
                ? Container(
                    padding: EdgeInsets.all(10),
                    child: Stack(
                      children: <Widget>[
                        CircularProgressIndicator(
                          strokeWidth: 1,
                        )
                      ],
                    ),
                  )
                : UserActiveItem(
                    activeUser: state.activeUsers[index],
                  );
          },
          scrollDirection: Axis.horizontal,
          itemCount: state.hasReachedMax
              ? state.activeUsers.length
              : state.activeUsers.length + 1,
          controller: this._scrollController,
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
          itemExtent: 120,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
                    child: Text('Active users'),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(color: Color(0xffaeaeae), width: 0.5),
                        ),
                      ),
                      padding: EdgeInsets.only(bottom: 10, top: 10),
                      child: this._buildActiveUserWidget(state),
                    ),
                  )
                ],
              );
            },
            childCount: 1,
          ),
        );
      },
    );
  }
}
