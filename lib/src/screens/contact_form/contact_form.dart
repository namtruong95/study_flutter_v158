import 'package:flutter/material.dart';
import 'package:study_flutter_v158/src/constants/regex.dart';

class ContactForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  bool autoValidate = false;

  void _saveContact() {
    setState(() {
      this.autoValidate = true;
    });

    if (_formKey.currentState.validate()) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Processing Data'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
