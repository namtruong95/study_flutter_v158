import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/contact/contact.dart';
import 'package:study_flutter_v158/src/screens/contact_tab/contact/contact_item.dart';
import 'package:study_flutter_v158/src/shared/widgets/bottom_loader.dart';

class ContactList extends StatelessWidget {
  Widget _buildContent(ContactState state, int index) {
    if (state is ContactUninitialized) {
      return CircularProgressIndicator();
    }

    if (state is ContactError) {
      return Text('failed to fetch contacts');
    }

    if (state is ContactLoaded) {
      if (state.contacts.isEmpty) {
        return Text('no contact');
      }

      return index >= state.contacts.length
          ? BottomLoader()
          : ContactItem(
              contact: state.contacts[index],
            );
    }

    return null;
  }

  Widget _buildState(ContactState state) {
    return SliverFixedExtentList(
      itemExtent: 70,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            child: this._buildContent(state, index),
          );
        },
        childCount: (state is ContactLoaded)
            ? state.hasReachedMax
                ? state.contacts.length
                : state.contacts.length + 1
            : 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _blocContact = BlocProvider.of(context);
    return this._buildState(_blocContact.currentState);
  }
}
