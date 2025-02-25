import 'dart:convert';
import 'package:auth_module/data/models/user_model.dart';
import 'package:home_module/data/mappers/stored_qr_mapper.dart';
import 'package:home_module/data/models/stored_qr_model.dart';
import 'package:home_module/domain/entities/qr_scann_entity.dart';
import 'package:seek_secure_store/seek_secure_store.dart';
import 'package:shared_module/features/storage/data/datasources/seek_storage_datasource.dart';
import 'package:shared_module/errors/exceptions.dart';

class SeekStorageDatasourceImpl implements SeekStorageDatasource {
  final SeekStorage _storage;

  SeekStorageDatasourceImpl({required SeekStorage storage}) : _storage = storage;

  static const String historyKey = 'qr_scan_history';
  static const String userKey = 'user';

  @override
  Future<UserModel?> getUser() async {
    try {
      final String? data = await _storage.read(key: userKey);
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
      );
      await _storage.write(key: userKey, value: jsonString);
      return true;
    } catch (e) {
      throw LocalDatabaseException(message: e.toString());
    }
  }

  @override
  Future<void> clearQrHistory() async {
    try {
      await _storage.delete(key: historyKey);
    } catch (e) {
      throw LocalDatabaseException(message: e.toString());
    }
  }
  @override
  Future<List<StoredQr>> getQrScanHistory() async {
    try {
      final String? data = await _storage.read(key: historyKey);
      if (data == null) return [];
      final List<dynamic> jsonData = jsonDecode(data);
      return jsonData.map((e) => StoredQr.fromJson(e)).toList();
    } catch (e) {
      throw LocalDatabaseException(message: e.toString());
    }
  }

  @override
  Future<void> saveQrScan(QrScan qrScan) async {
    try {
      final List<StoredQr> history = await getQrScanHistory();
      history.add(StoreQrMapper.toModel(qrScan));
      final String jsonString = jsonEncode(history.map((e) => e.toJson()).toList());
      await _storage.write(key: historyKey, value: jsonString);
    } catch (e) {
      throw LocalDatabaseException(message: e.toString());
    }
  }
}
