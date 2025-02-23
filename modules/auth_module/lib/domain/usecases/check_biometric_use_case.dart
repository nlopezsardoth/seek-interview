import 'package:auth_module/domain/repositories/biometric_auth_repository.dart';
import 'package:shared_module/use_cases/generic_use_cases.dart';
import 'package:shared_module/utils/typedefs.dart';

class CheckBiometricUseCase extends FutureUseCase<bool, void> {
  final BiometricAuthRepository biometricRepository;

  CheckBiometricUseCase(this.biometricRepository);

  @override
  ResultFuture<bool> call(void input) {
    return biometricRepository.biometricCanAuth();
  }
}