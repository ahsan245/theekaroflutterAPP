import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theek_karo/config.dart';

part 'user.freezed.dart';
part 'user.g.dart';

List<User> usersFromJson(dynamic str) =>
    List<User>.from((str).map((x) => User.fromJson(x)));

@freezed
abstract class User with _$User {
  factory User({
    required String fullName,
    required String password,
    required String email,
    required String userId,
    required String token,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
