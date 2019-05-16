import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/contact/contact.dart';
import 'package:study_flutter_v158/src/components/contact/contact_bloc.dart';
import 'package:study_flutter_v158/src/components/contact/contact_model.dart';
import 'package:study_flutter_v158/src/constants/regex.dart';
import 'package:study_flutter_v158/src/shared/widgets/input.dart';

class ContactForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  bool autoValidate = false;

  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _textController = TextEditingController();

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
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Input(
                  controller: _usernameController,
                  autovalidate: autoValidate,
                  required: 'Please enter username',
                  labelText: 'User Name',
                  hintText: 'Enter your username',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Input(
                  controller: _phoneController,
                  autovalidate: autoValidate,
                  required: 'Please enter some text',
                  labelText: 'Phone',
                  hintText: 'Enter your phone',
                  regExp: phoneRegex,
                  invalidText: 'phone is invalid',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Input(
                  controller: this._textController,
                  autovalidate: this.autoValidate,
                  required: 'Please enter some text',
                  labelText: 'Some Text',
                  hintText: 'Enter your some text',
                ),
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
      ),
    );
  }
}
