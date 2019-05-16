import 'package:flutter/material.dart';

import 'contact_form.dart';

class ContactFormLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Contact'),
      ),
      body: Container(child: ContactForm()),
    );
  }
}
