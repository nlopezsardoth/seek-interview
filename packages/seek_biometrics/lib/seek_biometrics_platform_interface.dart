import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:seek_biometrics/pigeons/pigeon.g.dart';

import 'seek_biometrics_method_channel.dart';

abstract class SeekBiometricsPlatform extends PlatformInterface {
  /// Constructs a SeekBiometricsPlatform.
  SeekBiometricsPlatform() : super(token: _token);

  static final Object _token = Object();

  static SeekBiometricsPlatform _instance = MethodChannelSeekBiometrics();

  /// The default instance of [SeekBiometricsPlatform] to use.
  ///
  /// Defaults to [MethodChannelSeekBiometrics].
  static SeekBiometricsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SeekBiometricsPlatform] when
  /// they register themselves.
  static set instance(SeekBiometricsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
    
  }

  Future<AuthResultDetails> authenticate({required String title, required String subtitle}) async {
    throw UnimplementedError('authenticate() has not been implemented.');
  }

  Future<bool> deviceSupportsBiometrics() async {
    throw UnimplementedError('canCheckBiometrics() has not been implemented.');
  }

  Future<List<AuthClassification>> getEnrolledBiometrics() async {
    throw UnimplementedError(
        'getAvailableBiometrics() has not been implemented.');
  }

  Future<bool> isDeviceSupported() async {
    throw UnimplementedError('isDeviceSupported() has not been implemented.');
  }

}
