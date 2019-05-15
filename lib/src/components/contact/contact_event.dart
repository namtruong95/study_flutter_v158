import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'contact_model.dart';

abstract class ContactEvent extends Equatable {}

class FetchContact extends ContactEvent {
  @override
  String toString() => 'FetchContact';
}

class AddContact extends ContactEvent {
  final ContactModel contact;

  AddContact({@required this.contact});

  @override
  String toString() => 'AddContact';
}
