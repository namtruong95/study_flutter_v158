import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:study_flutter_v158/src/components/message/message_model.dart';

abstract class MessageEvent extends Equatable {}

class FetchMessage extends MessageEvent {
  @override
  String toString() => 'FetchMessage';
}

class AddMessage extends MessageEvent {
  final MessageModel message;

  AddMessage({@required this.message});

  @override
  String toString() => 'AddMessage';
}
