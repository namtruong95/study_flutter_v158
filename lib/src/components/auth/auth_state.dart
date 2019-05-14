import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter_v158/src/commons/global_scope.dart';

abstract class AuthState extends Equatable {}

class AuthUninitialized extends AuthState {
  @override
  String toString() => 'AuthUninitialized';
}

class AuthAuthenticated extends AuthState {
  final String token;

  @override
  AuthAuthenticated({@required this.token}) {
    GlobalScope().token = this.token;
  }

  String getToken() {
    return token;
  }

  @override
  String toString() => 'AuthAuthenticated';
}

class AuthUnauthenticated extends AuthState {
  @override
  String toString() => 'AuthUnauthenticated';
}

class AuthLoading extends AuthState {
  @override
  String toString() => 'AuthLoading';
}
