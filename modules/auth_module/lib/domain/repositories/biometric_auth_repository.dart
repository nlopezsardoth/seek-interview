import 'package:auth_module/domain/entities/biometric_auth_parameters.dart';
import 'package:auth_module/domain/entities/biometric_auth_response.dart';
import 'package:shared_module/utils/typedefs.dart';

abstract class BiometricAuthRepository {
  ResultFuture<BioAuthResult> biometricAuth({
    required BiometricAuthParams params,
  });

  ResultFuture<bool> biometricCanAuth();
}
