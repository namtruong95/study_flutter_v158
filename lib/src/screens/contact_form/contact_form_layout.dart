import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/contact/contact.dart';

import 'contact_form.dart';

class ContactFormLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _contactBloc = BlocProvider.of<ContactBloc>(context);

    print(_contactBloc.currentState);

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Contact'),
      ),
      body: Container(child: ContactForm()),
    );
  }
}
