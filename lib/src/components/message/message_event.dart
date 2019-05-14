import 'package:equatable/equatable.dart';

abstract class MessageEvent extends Equatable {}

class FetchMessage extends MessageEvent {
  @override
  String toString() => 'FetchMessage';
}
