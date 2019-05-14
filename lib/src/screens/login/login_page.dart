import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:study_flutter_v158/src/components/auth/auth.dart';
import 'package:study_flutter_v158/src/components/login/login.dart';
import 'package:study_flutter_v158/src/shared/widgets/container_bg.dart';

import 'login_form.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc;
  AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _loginBloc = LoginBloc(
      authBloc: this._authBloc,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: new ContainerBg(
        child: Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                child: LoginForm(
                  authBloc: this._authBloc,
                  loginBloc: this._loginBloc,
                ),
                height: 300.0,
                width: 400.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}
