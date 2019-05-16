import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/contact/contact.dart';
import 'package:study_flutter_v158/src/components/contact/contact_bloc.dart';
import 'package:study_flutter_v158/src/components/contact/contact_model.dart';
import 'package:study_flutter_v158/src/constants/regex.dart';

class ContactForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  bool autoValidate = false;

  final _usernameController = TextEditingController(text: 'name 1');
  final _phoneController = TextEditingController(text: '0909666666');

  ContactBloc _contactBloc;

  void _saveContact() {
    setState(() {
      this.autoValidate = true;
    });

    if (_formKey.currentState.validate()) {
      final contact = new ContactModel(
        name: this._usernameController.text,
        phone: this._phoneController.text,
        imagePath: 'https://picsum.photos/250?image=9',
      );

      this._contactBloc.dispatch(
            AddContact(contact: contact),
          );
      Navigator.pop(context);

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Processing Data'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    this._contactBloc = BlocProvider.of<ContactBloc>(context);

    return Container(
      padding: EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter username';
                }
              },
              autovalidate: this.autoValidate,
              decoration: InputDecoration(
                labelText: 'User Name',
                hintText: 'Enter your username',
              ),
              controller: _usernameController,
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter phone';
                }

                if (!phoneRegex.hasMatch(value)) {
                  return 'phone is invalid';
                }
              },
              autovalidate: this.autoValidate,
              decoration: InputDecoration(
                labelText: 'Phone',
                hintText: 'Enter your phone',
              ),
              controller: _phoneController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: this._saveContact,
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
