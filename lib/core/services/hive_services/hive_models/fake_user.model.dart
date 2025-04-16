import 'package:hive_ce_flutter/hive_flutter.dart';

part 'fake_user.model.g.dart';

@HiveType(typeId: 0) // Unique typeId for User object
class FakeUser extends HiveObject {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String password;
  @HiveField(2)
  final String? displayName;
  @HiveField(3)
  final bool? isLoggedIn;

  FakeUser({
    required this.email,
    required this.password,
    this.displayName,
    this.isLoggedIn,
  });

  FakeUser copyWith({
    String? email,
    String? password,
    String? displayName,
    bool? isLoggedIn,
  }) => FakeUser(
    email: email ?? this.email,
    password: password ?? this.password,
    displayName: displayName ?? this.displayName,
    isLoggedIn: isLoggedIn ?? this.isLoggedIn,
  );
}
