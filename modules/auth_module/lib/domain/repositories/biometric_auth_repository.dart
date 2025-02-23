import 'package:shared_module/utils/typedefs.dart';

abstract class BiometricAuthRepository {
  ResultFuture<bool> biometricAuth({
    required String iosLocalizedReason,
    required String androidLocalizedReason,
    required String androidSignInTitle,
    required String androidBiometricHint,
    String? iosCancelButton,
    String? iosGoToSettingsButton,
    String? iosGoToSettingsDescription,
    String? iosLockOut,
    String? androidCancelButton,
    String? androidGoToSettingsButton,
    String? androidGoToSettingsDescription,
    String? androidBiometricNotRecognized,
  });

  ResultFuture<bool> biometricCanAuth();
}
