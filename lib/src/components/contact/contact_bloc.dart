import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:study_flutter_v158/src/repositories/contact_repository.dart';
import 'contact.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository contactRepo = new ContactRepository();

  @override
  ContactState get initialState => ContactUninitialized();

  @override
  Stream<ContactState> mapEventToState(
    ContactEvent event,
  ) async* {
    if (event is FetchContact && !this._hasNextPage(currentState)) {
      try {
        if (currentState is ContactUninitialized) {
          final contacts = await contactRepo.fetchContacts();

          yield ContactLoaded(contacts: contacts, hasReachedMax: false);
          return;
        }

        if (currentState is ContactLoaded) {
          final contacts = await contactRepo.fetchContacts();

          yield contacts.isEmpty
              ? (currentState as ContactLoaded).copyWith(hasReachedMax: true)
              : ContactLoaded(
                  contacts: (currentState as ContactLoaded).contacts + contacts,
                  hasReachedMax: true,
                );
        }
      } catch (e) {
        yield ContactError();
      }

      return;
    }

    if (event is AddContact) {
      if (currentState is ContactLoaded) {
        yield ContactLoaded(
            contacts:
                [event.contact] + (currentState as ContactLoaded).contacts,
            hasReachedMax: (currentState as ContactLoaded).hasReachedMax);
      }
      return;
    }
  }

  bool _hasNextPage(ContactState state) =>
      state is ContactLoaded && state.hasReachedMax;
}
