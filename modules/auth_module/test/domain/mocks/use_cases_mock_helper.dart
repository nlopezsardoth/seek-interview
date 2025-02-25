import 'package:auth_module/domain/usecases/use_cases.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  BiometricAuthUseCase,
  CheckBiometricUseCase,
  GetUserUseCase,
  LogInUseCase,
  SetNewPinUseCase,
  ValidatePinUseCase,
])
class UseCasesMockHelper {}