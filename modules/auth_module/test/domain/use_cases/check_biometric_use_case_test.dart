import 'package:auth_module/domain/usecases/check_biometric_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_module/errors/failures.dart';

import '../../data/mocks/repositories_mock_helper.mocks.dart';

void main() {
  late CheckBiometricUseCase checkBiometricUseCase;
  late MockBiometricAuthRepository mockBiometricAuthRepository;

  setUp(() {
    mockBiometricAuthRepository = MockBiometricAuthRepository();
    checkBiometricUseCase = CheckBiometricUseCase(mockBiometricAuthRepository);
  });

  test('GIVEN biometric authentication is available '
      'WHEN calling the use case '
      'THEN it should return true', () async {
    when(mockBiometricAuthRepository.biometricCanAuth())
        .thenAnswer((_) async => const Right(true));

    final result = await checkBiometricUseCase(null);

    expect(result, const Right<Failure, bool>(true));
    verify(mockBiometricAuthRepository.biometricCanAuth()).called(1);
    verifyNoMoreInteractions(mockBiometricAuthRepository);
  });

  test('GIVEN biometric authentication is not available '
      'WHEN calling the use case '
      'THEN it should return false', () async {
    when(mockBiometricAuthRepository.biometricCanAuth())
        .thenAnswer((_) async => const Right(false));

    final result = await checkBiometricUseCase(null);

    expect(result, const Right<Failure, bool>(false));
    verify(mockBiometricAuthRepository.biometricCanAuth()).called(1);
    verifyNoMoreInteractions(mockBiometricAuthRepository);
  });

}