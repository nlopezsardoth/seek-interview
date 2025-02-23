class BiometricAuthParams {
  final String iosLocalizedReason;
  final String androidLocalizedReason;
  final String androidSignInTitle;
  final String androidBiometricHint;
  final String? iosCancelButton;
  final String? iosGoToSettingsButton;
  final String? iosGoToSettingsDescription;
  final String? iosLockOut;
  final String? androidCancelButton;
  final String? androidGoToSettingsButton;
  final String? androidGoToSettingsDescription;
  final String? androidBiometricNotRecognized;

  BiometricAuthParams({
    required this.iosLocalizedReason,
    required this.androidLocalizedReason,
    required this.androidSignInTitle,
    required this.androidBiometricHint,
    this.iosCancelButton,
    this.iosGoToSettingsButton,
    this.iosGoToSettingsDescription,
    this.iosLockOut,
    this.androidCancelButton,
    this.androidGoToSettingsButton,
    this.androidGoToSettingsDescription,
    this.androidBiometricNotRecognized,
  });
}