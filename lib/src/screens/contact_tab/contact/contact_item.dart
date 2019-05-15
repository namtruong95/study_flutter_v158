import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study_flutter_v158/src/components/contact/contact_model.dart';
import 'package:study_flutter_v158/src/shared/widgets/image_cached.dart';

import 'contact_detail.dart';

class ContactItem extends StatelessWidget {
  final ContactModel contact;

  const ContactItem({this.contact}) : assert(contact != null);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return ContactDetail(contact: this.contact);
        }));
      },
      leading: ImageCached(
        width: 50,
        height: 50,
        url: this.contact.imagePath,
      ),
      title: Text(this.contact.name),
    );
  }
}
