import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:study_flutter_v158/src/components/auth/auth.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;
  final AuthBloc authBloc;

  LoginButtonPressed(
      {@required this.email, @required this.password, @required this.authBloc})
      : super([email, password]);

  @override
  String toString() =>
      'LoginButtonPressed { email: $email, password: $password }';
}
