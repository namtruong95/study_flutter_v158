import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:study_flutter_v158/src/components/active_user/active_user_model.dart';

class ActiveUserRepository {
  static final ActiveUserRepository _activeUserRepository =
      new ActiveUserRepository._internal();
  factory ActiveUserRepository() => _activeUserRepository;
  ActiveUserRepository._internal();

  FutureOr<List<ActiveUserModel>> fetchActiveUsers() async {
    final JsonDecoder _decoder = new JsonDecoder();

    final res =
        await rootBundle.loadString('lib/assets/mock_data/activeUsers.json');
    await Future.delayed(Duration(milliseconds: 1000));
    final json = _decoder.convert(res);

    return (json['data'] as List)
        .map((item) => ActiveUserModel.fromMap(item))
        .toList();
  }
}
