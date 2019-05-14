import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/screens/home/home_widget.dart';

import 'components/auth/auth.dart';
import 'screens/login/login_page.dart';
import 'shared/widgets/loading_indicator.dart';
import 'shared/widgets/splash_page.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = AuthBloc();
    _authBloc.dispatch(AppStarted());
    super.initState();
  }

  @override
  void dispose() {
    _authBloc.dispose();
    super.dispose();
  }

  Widget _buildState(AuthState state) {
    if (state is AuthUninitialized) {
      return SplashPage();
    }
    if (state is AuthAuthenticated) {
      return HomeWidget();
    }
    if (state is AuthUnauthenticated) {
      return LoginPage();
    }
    if (state is AuthLoading) {
      return LoadingIndicator();
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      bloc: _authBloc,
      child: MaterialApp(
        home: BlocBuilder<AuthEvent, AuthState>(
          bloc: _authBloc,
          builder: (BuildContext context, AuthState state) {
            return _buildState(state);
          },
        ),
      ),
    );
  }
}
