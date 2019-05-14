import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:study_flutter_v158/src/shared/widgets/container_bg.dart';

import 'login_form.dart';

class LoginPage extends StatelessWidget {
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
                child: LoginForm(),
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
}
