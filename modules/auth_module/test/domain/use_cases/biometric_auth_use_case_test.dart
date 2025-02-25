import 'package:auth_module/domain/entities/biometric_auth_parameters.dart';
import 'package:auth_module/domain/entities/biometric_auth_response.dart';
import 'package:auth_module/domain/usecases/biometric_auth_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_module/errors/failures.dart';

import '../../data/mocks/repositories_mock_helper.mocks.dart';

void main() {
  late BiometricAuthUseCase authUseCase;
  final mockBiometricAuthRepository = MockBiometricAuthRepository();

  final initParams = BiometricAuthParams(
    title: 'Authenticate to access',
    subtitle: 'Authenticate to access',
  );

  setUpAll(() {
    authUseCase = BiometricAuthUseCase(mockBiometricAuthRepository);
  });

  test('GIVEN valid biometric authentication params '
      'WHEN calling the use case '
      'THEN it should return true', () async {
    when(
      mockBiometricAuthRepository.biometricAuth(params: anyNamed('params')),
    ).thenAnswer(
      (_) async => Right<Failure, BioAuthResult>(BioAuthResult.success),
    );

    final result = await authUseCase(initParams);

    expect(result, const Right<Failure, BioAuthResult>(BioAuthResult.success));
    verify(
      mockBiometricAuthRepository.biometricAuth(params: anyNamed('params')),
    ).called(1);
    verifyNoMoreInteractions(mockBiometricAuthRepository);
  });

  test('GIVEN valid biometric authentication params '
      'WHEN calling the use case '
      'THEN it should return false', () async {
    when(
      mockBiometricAuthRepository.biometricAuth(params: anyNamed('params')),
    ).thenAnswer(
      (_) async => Right<Failure, BioAuthResult>(BioAuthResult.failure),
    );

    final result = await authUseCase(initParams);

    expect(result, const Right<Failure, BioAuthResult>(BioAuthResult.failure));
    verify(
      mockBiometricAuthRepository.biometricAuth(params: anyNamed('params')),
    ).called(1);
    verifyNoMoreInteractions(mockBiometricAuthRepository);
  });
}
