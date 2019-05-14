import 'package:equatable/equatable.dart';

abstract class ChannelEvent extends Equatable {}

class FetchChannel extends ChannelEvent {
  @override
  String toString() => 'FetchChannel';
}
