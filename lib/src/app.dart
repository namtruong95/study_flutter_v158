import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter_v158/src/components/active_user/active_user_bloc.dart';
import 'package:study_flutter_v158/src/components/channel/channel.dart';
import 'package:study_flutter_v158/src/components/contact/contact_bloc.dart';
import 'package:study_flutter_v158/src/screens/home/home_widget.dart';
import 'package:study_flutter_v158/src/screens/notification/notification_page.dart';

import 'components/auth/auth.dart';
import 'screens/contact_form/contact_form_layout.dart';
import 'screens/login/login_page.dart';
import 'shared/widgets/loading_indicator.dart';
import 'shared/widgets/splash_page.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AuthBloc _authBloc;
  ContactBloc _contactBloc;
  ChannelBloc _channelBloc;
  ActiveUserBloc _activeUserBloc;

  @override
  void initState() {
    _authBloc = AuthBloc();
    _authBloc.dispatch(AppStarted());
    _contactBloc = ContactBloc();
    _channelBloc = ChannelBloc();
    _activeUserBloc = ActiveUserBloc();
    super.initState();
  }

  @override
  void dispose() {
    _authBloc.dispose();
    _contactBloc.dispose();
    _channelBloc.dispose();
    _activeUserBloc.dispose();
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

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<AuthBloc>(
          bloc: _authBloc,
        ),
        BlocProvider<ContactBloc>(
          bloc: _contactBloc,
        ),
        BlocProvider<ChannelBloc>(
          bloc: _channelBloc,
        ),
        BlocProvider<ActiveUserBloc>(
          bloc: _activeUserBloc,
        ),
      ],
      child: MaterialApp(
        home: BlocBuilder<AuthEvent, AuthState>(
          bloc: _authBloc,
          builder: (BuildContext context, AuthState state) {
            return this._buildState(state);
          },
        ),
        routes: {
          '/notification': (context) => NotificationPage(),
          '/contact/create': (context) => ContactFormLayout()
        },
      ),
    );
  }
}
