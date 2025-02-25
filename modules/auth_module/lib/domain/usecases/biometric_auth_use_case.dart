import 'package:auth_module/domain/entities/biometric_auth_parameters.dart';
import 'package:auth_module/domain/entities/biometric_auth_response.dart';
import 'package:auth_module/domain/repositories/biometric_auth_repository.dart';
import 'package:shared_module/use_cases/generic_use_cases.dart';
import 'package:shared_module/utils/typedefs.dart';

class BiometricAuthUseCase
    extends FutureUseCase<BioAuthResult, BiometricAuthParams> {
  final BiometricAuthRepository biometricAuthRepository;

  BiometricAuthUseCase(this.biometricAuthRepository);

  @override
  ResultFuture<BioAuthResult> call(BiometricAuthParams input) {
    return biometricAuthRepository.biometricAuth(params: input);
  }
}
