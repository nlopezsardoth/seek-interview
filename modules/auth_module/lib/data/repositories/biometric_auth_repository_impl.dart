import 'package:auth_module/domain/repositories/biometric_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_module/errors/exceptions.dart';
import 'package:shared_module/errors/failures.dart';
import 'package:shared_module/utils/typedefs.dart';

class BiometricAuthRepositoryImpl implements BiometricAuthRepository {
  @override
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
  }) async {
    try {
      return Left(LocalFailure(message: "FAill"));
    } on LocalDatabaseException catch (e) {
      return Left(LocalFailure(message: e.message));
    }
  }

  @override
  ResultFuture<bool> biometricCanAuth() async {
    try {
      return Left(LocalFailure(message: "FAill"));
    } on LocalDatabaseException catch (e) {
      return Left(LocalFailure(message: e.message));
    }
  }
}
