import 'dart:convert';

import 'package:auth_module/data/datasources/user_local_datasource.dart';
import 'package:auth_module/data/models/user_model.dart';
import 'package:seek_secure_store/seek_secure_store.dart';
import 'package:shared_module/errors/exceptions.dart';

class UserLocalDatasourceImpl implements UserLocalDatasource {
  final SeekStorage _storage;

  UserLocalDatasourceImpl({required SeekStorage storage}) : _storage = storage;

  @override
  Future<UserModel?> getUser() async {
    try {
      final String? data = await _storage.read(key: 'user');
      if (data == null) return null;
      final Map<String, dynamic> jsonData = jsonDecode(data);
      return UserModel.fromJson(jsonData);
    } catch (e) {
      throw LocalDatabaseException(message: e.toString());
    }
  }

  @override
  Future<bool> putUser({required UserModel recentUserLocal}) async {
    try {
      final jsonString = jsonEncode(
        recentUserLocal.toJson(),
      ); // Convert to JSON string
      await _storage.write(key: 'user', value: jsonString);
      return true;
    } catch (e) {
      throw LocalDatabaseException(message: e.toString());
    }
  }
}
