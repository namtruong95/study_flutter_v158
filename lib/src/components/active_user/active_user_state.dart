import 'package:equatable/equatable.dart';

import 'active_user_model.dart';

abstract class ActiveUserState extends Equatable {
  ActiveUserState([List props = const []]) : super(props);
}

class ActiveUserUninitialized extends ActiveUserState {
  @override
  String toString() => 'ActiveUserUninitialized';
}

class ActiveUserError extends ActiveUserState {
  @override
  String toString() => 'ActiveUserError';
}

class ActiveUserLoaded extends ActiveUserState {
  final List<ActiveUserModel> activeUsers;
  final bool hasReachedMax;

  ActiveUserLoaded({
    this.activeUsers,
    this.hasReachedMax,
  }) : super([activeUsers, hasReachedMax]);

  ActiveUserLoaded copyWith({
    List<ActiveUserModel> activeUsers,
    bool hasReachedMax,
  }) {
    return ActiveUserLoaded(
      activeUsers: activeUsers ?? this.activeUsers,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() =>
      'ActiveUserLoaded { users: ${activeUsers.length}, hasReachedMax: $hasReachedMax }';
}
