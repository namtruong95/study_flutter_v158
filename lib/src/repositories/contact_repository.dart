import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:study_flutter_v158/src/components/contact/contact_model.dart';

class ContactRepository {
  static final ContactRepository _contactRepository =
      new ContactRepository._internal();
  factory ContactRepository() => _contactRepository;
  ContactRepository._internal();

  FutureOr<List<ContactModel>> fetchContacts() async {
    final JsonDecoder _decoder = new JsonDecoder();

    final res =
        await rootBundle.loadString('lib/assets/mock_data/contacts.json');
    await Future.delayed(Duration(milliseconds: 1000));
    final json = _decoder.convert(res);

    return (json['data'] as List)
        .map((item) => ContactModel.fromMap(item))
        .toList();
  }
}
