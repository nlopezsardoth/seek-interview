import 'package:seek_biometrics/pigeons/pigeon.g.dart';

import 'seek_biometrics_platform_interface.dart';

/// An implementation of [SeekBiometricsPlatform] that uses method channels.
class MethodChannelSeekBiometrics extends SeekBiometricsPlatform {
  final SeekAuthApi _seekApi;

   MethodChannelSeekBiometrics({SeekAuthApi? seekApi}) 
      : _seekApi = seekApi ?? SeekAuthApi();

  @override
  Future<AuthResultDetails> authenticate({
    required String title,
    required String subtitle,
  }) async {
    return await _seekApi.authenticate(title, subtitle);
  }

  @override
  Future<List<AuthClassification>> getEnrolledBiometrics() async {
    return await _seekApi.getEnrolledBiometrics();
  }

  @override
  Future<bool> deviceSupportsBiometrics() async {
    return await _seekApi.deviceCanSupportBiometrics();
  }

  @override
  Future<bool> isDeviceSupported() async {
  return await _seekApi.isDeviceSupported();
}
}
