import 'package:equatable/equatable.dart';

abstract class ActiveUserEvent extends Equatable {}

class FetchActiveUser extends ActiveUserEvent {
  @override
  String toString() => 'FetchActiveUser';
}
