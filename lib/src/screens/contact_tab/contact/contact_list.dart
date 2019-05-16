import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/contact/contact.dart';
import 'package:study_flutter_v158/src/screens/contact_tab/contact/contact_item.dart';
import 'package:study_flutter_v158/src/shared/widgets/bottom_loader.dart';

class ContactList extends StatelessWidget {
  Widget _buildContent(ContactState state, int index) {
    if (state is ContactUninitialized) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is ContactError) {
      return Center(
        child: Text('failed to fetch data'),
      );
    }

    if (state is ContactLoaded) {
      if (state.contacts.isEmpty) {
        return Center(
          child: Text('no data'),
        );
      }

      return index >= state.contacts.length
          ? BottomLoader()
          : ContactItem(contact: state.contacts[index]);
    }

    return Container();
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
    final _blocContact = BlocProvider.of<ContactBloc>(context);
    return this._buildState(_blocContact.currentState);
  }
}
