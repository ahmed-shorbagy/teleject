import 'dart:convert';

import 'package:collection/collection.dart';

import 'user.dart';

class UserModel {
  AppUser? user;
  String? token;

  UserModel({this.user, this.token});

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        user: data['user'] == null
            ? null
            : AppUser.fromMap(data['user'] as Map<String, dynamic>),
        token: data['token'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'user': user?.toMap(),
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserModel].
  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UserModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => user.hashCode ^ token.hashCode;
}
