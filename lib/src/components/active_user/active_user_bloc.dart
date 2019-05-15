import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:study_flutter_v158/src/repositories/active_user_repository.dart';

import 'active_user.dart';

class ActiveUserBloc extends Bloc<ActiveUserEvent, ActiveUserState> {
  final ActiveUserRepository activeUserRepo = new ActiveUserRepository();

  @override
  ActiveUserState get initialState => ActiveUserUninitialized();

  @override
  Stream<ActiveUserState> mapEventToState(
    ActiveUserEvent event,
  ) async* {
    if (event is FetchActiveUser && !this._hasNextPage(currentState)) {
      try {
        if (currentState is ActiveUserUninitialized) {
          final activeUsers = await activeUserRepo.fetchActiveUsers();

          yield ActiveUserLoaded(
              activeUsers: activeUsers, hasReachedMax: false);
          return;
        }

        if (currentState is ActiveUserLoaded) {
          final activeUsers = await activeUserRepo.fetchActiveUsers();

          yield activeUsers.isEmpty
              ? (currentState as ActiveUserLoaded).copyWith(hasReachedMax: true)
              : ActiveUserLoaded(
                  activeUsers: (currentState as ActiveUserLoaded).activeUsers +
                      activeUsers,
                  hasReachedMax: true,
                );
        }
      } catch (e) {
        yield ActiveUserError();
      }
    }
  }

  bool _hasNextPage(ActiveUserState state) =>
      state is ActiveUserLoaded && state.hasReachedMax;
}
