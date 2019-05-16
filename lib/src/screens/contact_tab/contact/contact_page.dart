import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/contact/contact.dart';

import 'contact_button_create.dart';
import 'contact_list.dart';

class ContactPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  ContactBloc _contactBloc;

  @override
  void initState() {
    this._scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      this._contactBloc.dispatch(FetchContact());
    }
  }

  @override
  Widget build(BuildContext context) {
    this._contactBloc = BlocProvider.of<ContactBloc>(context);
    this._contactBloc.dispatch(FetchContact());

    return BlocBuilder(
      bloc: _contactBloc,
      builder: (BuildContext context, ContactState state) {
        return Stack(
          children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[
                ContactList(),
              ],
              controller: _scrollController,
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: ContactButtonCreate(),
            )
          ],
        );
      },
    );
  }
}
