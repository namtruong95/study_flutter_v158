import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:study_flutter_v158/src/components/auth/auth.dart';
import 'package:study_flutter_v158/src/commons/global_scope.dart';
import 'package:study_flutter_v158/src/repositories/user_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository = new UserRepository();

  @override
  AuthState get initialState => AuthUninitialized();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      final String token = await userRepository.fetchToken();

      if (['', null, false].contains(token)) {
        yield AuthUnauthenticated();
      } else {
        yield AuthAuthenticated(token: token);
      }
    }

    if (event is LoggedIn) {
      yield AuthLoading();
      await userRepository.persistToken(event.token);
      yield AuthAuthenticated(token: event.token);
    }

    if (event is LoggedOut) {
      yield AuthLoading();
      await userRepository.deleteToken();
      GlobalScope().clear();
      yield AuthUnauthenticated();
    }
  }
}
