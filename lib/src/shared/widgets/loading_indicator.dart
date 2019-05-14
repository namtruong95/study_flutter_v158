import 'package:flutter/material.dart';
import 'container_bg.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerBg(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
