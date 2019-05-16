import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final bool autovalidate;

  // optional
  final String labelText;
  final String hintText;

  // validation
  final String required;
  final RegExp regExp;
  final String invalidText;

  const Input({
    this.controller,
    this.autovalidate = false,
    this.labelText = '',
    this.hintText = '',
    this.required,
    this.regExp,
    this.invalidText,
  })  : assert(controller != null),
        assert((regExp == null && invalidText == null) ||
            (regExp != null && invalidText != null));

  @override
  State<StatefulWidget> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (widget.required != null && value.isEmpty) {
          return widget.required;
        }

        if (widget.regExp != null && !widget.regExp.hasMatch(value)) {
          return widget.invalidText;
        }
      },
      autovalidate: widget.autovalidate,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        border: OutlineInputBorder(),
      ),
      controller: widget.controller,
    );
  }
}
