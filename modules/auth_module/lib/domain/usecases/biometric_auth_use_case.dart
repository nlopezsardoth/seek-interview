
import 'package:auth_module/domain/entities/biometric_auth_parameters.dart';
import 'package:auth_module/domain/repositories/biometric_auth_repository.dart';
import 'package:shared_module/use_cases/generic_use_cases.dart';
import 'package:shared_module/utils/typedefs.dart';

class BiometricAuthUseCase
    extends FutureUseCase<bool, BiometricAuthParams> {
  final BiometricAuthRepository biometricAuthRepository;

  BiometricAuthUseCase(this.biometricAuthRepository);

  @override
  ResultFuture<bool> call(BiometricAuthParams input) {
    return biometricAuthRepository.biometricAuth(
      iosLocalizedReason: input.iosLocalizedReason,
      androidLocalizedReason: input.androidLocalizedReason,
      iosCancelButton: input.iosCancelButton,
      iosGoToSettingsButton: input.iosGoToSettingsButton,
      iosGoToSettingsDescription: input.iosGoToSettingsDescription,
      iosLockOut: input.iosLockOut,
      androidSignInTitle: input.androidSignInTitle,
      androidCancelButton: input.androidCancelButton,
      androidGoToSettingsButton: input.androidGoToSettingsButton,
      androidGoToSettingsDescription: input.androidGoToSettingsDescription,
      androidBiometricNotRecognized: input.androidBiometricNotRecognized,
      androidBiometricHint: input.androidBiometricHint,
    );
  }
}
