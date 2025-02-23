import 'package:pigeon/pigeon.dart';

enum AuthResult { success, failure, error }


class AuthResultDetails {
  AuthResultDetails(
      {required this.result, this.errorMessage});

  /// The result of authenticating.
  final AuthResult result;

  /// A system-provided error message, if any.
  final String? errorMessage;

}


enum AuthClassification { face, fingerprint, iris, weak, strong }

@HostApi()
abstract class SeekAuthApi {
  /// Returns true if this device supports authentication.
  bool isDeviceSupported();

  /// Returns true if this device can support biometric authentication, whether
  /// any biometrics are enrolled or not.
  bool deviceCanSupportBiometrics();

  /// Returns the biometric types that are enrolled, and can thus be used
  /// without additional setup.
  List<AuthClassification> getEnrolledBiometrics();

  @async
  AuthResultDetails authenticate(String title, String subtitle);
}
