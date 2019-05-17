import 'package:equatable/equatable.dart';

import 'contact_model.dart';

abstract class ContactState extends Equatable {
  ContactState([List props = const []]) : super(props);
}

class ContactUninitialized extends ContactState {
  @override
  String toString() => 'ContactUninitialized';
}

class ContactError extends ContactState {
  @override
  String toString() => 'ContactError';
}

class ContactLoaded extends ContactState {
  final List<ContactModel> contacts;
  final bool hasReachedMax;

  ContactLoaded({
    this.contacts,
    this.hasReachedMax,
  }) : super([contacts, hasReachedMax]);

  ContactLoaded copyWith({
    List<ContactModel> contacts,
    bool hasReachedMax,
  }) {
    return ContactLoaded(
      contacts: contacts ?? this.contacts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  ContactLoaded addContact({
    ContactModel contact,
  }) {
    this.contacts.insert(0, contact);
    return this;
  }

  @override
  String toString() =>
      'ContactLoaded { contacts: ${contacts.length}, hasReachedMax: $hasReachedMax }';
}
