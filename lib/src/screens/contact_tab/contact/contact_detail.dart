import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study_flutter_v158/src/components/contact/contact_model.dart';

class ContactDetail extends StatelessWidget {
  final ContactModel contact;

  const ContactDetail({this.contact}) : assert(contact != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.contact.name),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(
            'Back',
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
