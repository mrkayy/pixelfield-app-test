import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:pixel_field_app/core/services/hive_services/hive_models/fake_user.model.dart';

class HiveLocalStorageServices {
  static const String _usersBoxName = "users";
  static const String _collectionBoxName = "collection";

  Future<Box<FakeUser>> get _usersBox async =>
      await Hive.openBox<FakeUser>(_usersBoxName);
  Future<Box> get _collectionBox async =>
      await Hive.openBox(_collectionBoxName);

  // User Box Operations

  Future<void> saveUser(FakeUser user) async {
    final box = await _usersBox;
    await box.put(user.email, user); // Using email as a unique key
  }

  Future<FakeUser?> getUser(String email) async {
    final box = await _usersBox;
    return box.get(email);
  }

  Future<bool> isUserRegistered(String email) async {
    final box = await _usersBox;
    return box.containsKey(email);
  }

  Future<void> deleteUser(String email) async {
    final box = await _usersBox;
    await box.delete(email);
  }

  // Collection Box Operations (Example - Adapt based on your collection data structure)

  Future<dynamic> getCollectionData(String key) async {
    final box = await _collectionBox;
    return box.get(key);
  }

  Future<void> saveCollectionData(String key, dynamic data) async {
    final box = await _collectionBox;
    await box.put(key, data);
  }

  Future<void> deleteCollectionData(String key) async {
    final box = await _collectionBox;
    await box.delete(key);
  }
}
