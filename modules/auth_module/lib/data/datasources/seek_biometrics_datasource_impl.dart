import 'package:auth_module/data/datasources/seek_biometrics_datasource.dart';
import 'package:seek_biometrics/pigeons/pigeon.g.dart';
import 'package:seek_biometrics/seek_biometrics.dart';
import 'package:shared_module/errors/exceptions.dart';

class SeekBiometricsDatasourceImpl implements SeekBiometricsDatasource {
  final SeekBiometrics _seekBiometrics;

  SeekBiometricsDatasourceImpl({required SeekBiometrics seekBiometrics})
    : _seekBiometrics = seekBiometrics;

  @override
  Future<List<AuthClassification>> getEnrolledBiometrics() async {
    try {
      return await _seekBiometrics.getEnrolledBiometrics();
    } catch (e) {
      throw BiometricAuthException(message: e.toString());
    }
  }

  @override
  Future<bool> deviceSupportsBiometrics() async {
    try {
      return await _seekBiometrics.deviceSupportsBiometrics();
    } catch (e) {
      throw BiometricAuthException(message: e.toString());
    }
  }

  @override
  Future<bool> isDeviceSupported() async {
    try {
      return await _seekBiometrics.isDeviceSupported();
    } catch (e) {
      throw BiometricAuthException(message: e.toString());
    }
  }

  @override
  Future<AuthResultDetails> authenticate({
    required String title,
    required String subtitle,
  }) async {
    try {
      return await _seekBiometrics.authenticate(
        title: title,
        subtitle: subtitle,
      );
    } catch (e) {
      throw BiometricAuthException(message: e.toString());
    }
  }
}
