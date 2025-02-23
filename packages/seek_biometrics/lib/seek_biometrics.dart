
import 'package:seek_biometrics/pigeons/pigeon.g.dart';

import 'seek_biometrics_platform_interface.dart';

class SeekBiometrics {

  Future<AuthResultDetails> authenticate({
    required String title,
    required String subtitle,
  }) async {
    return SeekBiometricsPlatform.instance.authenticate(title: title, subtitle: subtitle);
  }

  Future<List<AuthClassification>> getEnrolledBiometrics() async {
    return SeekBiometricsPlatform.instance.getEnrolledBiometrics();
  }

  Future<bool> deviceSupportsBiometrics() async {
    return SeekBiometricsPlatform.instance.deviceSupportsBiometrics();
  }

  Future<bool> isDeviceSupported() async {
    return SeekBiometricsPlatform.instance.isDeviceSupported();
  }

}
