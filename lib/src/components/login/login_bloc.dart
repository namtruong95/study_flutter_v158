import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:study_flutter_v158/src/components/login/login.dart';
import 'package:study_flutter_v158/src/components/auth/auth.dart';
import 'package:study_flutter_v158/src/repositories/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository = new AuthRepository();
  final AuthBloc authBloc;

  LoginBloc({
    @required this.authBloc,
  }) : assert(authBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final String token = await authRepository.login(
          email: event.email,
          password: event.password,
        );

        yield LoginSuccess();
        await Future.delayed(Duration(milliseconds: 500));

        authBloc.dispatch(LoggedIn(token: token));
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
