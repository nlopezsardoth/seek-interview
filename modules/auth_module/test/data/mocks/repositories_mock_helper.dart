import 'package:auth_module/domain/repositories/biometric_auth_repository.dart';
import 'package:auth_module/domain/repositories/login_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  LoginRepository,
  BiometricAuthRepository,
])
class RepositoriesMockHelper {}
