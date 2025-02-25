import 'package:seek_biometrics/pigeons/pigeon.g.dart';
import 'package:seek_biometrics/seek_biometrics_platform_interface.dart';

abstract class SeekBiometricsDatasource implements SeekBiometricsPlatform {
  @override
  Future<AuthResultDetails> authenticate({
    required String title,
    required String subtitle,
  });
  @override
  Future<List<AuthClassification>> getEnrolledBiometrics();
  @override
  Future<bool> deviceSupportsBiometrics();
  @override
  Future<bool> isDeviceSupported();
}
