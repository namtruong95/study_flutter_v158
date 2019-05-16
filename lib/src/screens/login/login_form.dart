import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/auth/auth.dart';

import 'package:study_flutter_v158/src/components/login/login.dart';
import 'package:study_flutter_v158/src/shared/widgets/button_loading.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
    Key key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController =
      TextEditingController(text: 'kakaka.biz@gmail.com');
  final _passwordController = TextEditingController(text: 'Abcd@1234');
  LoginBloc _loginBloc;

  @override
  void initState() {
    _loginBloc = LoginBloc();
    super.initState();
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (
        BuildContext context,
        LoginState state,
      ) {
        if (state is LoginFailure) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }

        return Column(
          children: <Widget>[
            Text(
              'Login App',
              textScaleFactor: 2.0,
            ),
            Form(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(labelText: 'email'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: 'password'),
                      obscureText: true,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ButtonLoading(
                text: 'Login',
                onPressed: () {
                  _loginBloc.dispatch(
                    LoginButtonPressed(
                        email: _usernameController.text,
                        password: _passwordController.text,
                        authBloc: _authBloc),
                  );
                },
                isLoading: state is LoginLoading,
                isSuccess: state is LoginSuccess,
              ),
            )
          ],
        );
      },
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}
