import 'package:auth_module/domain/usecases/validate_pin_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_module/errors/failures.dart';

import '../../data/mocks/repositories_mock_helper.mocks.dart';

void main() {
  late ValidatePinUseCase validatePinUseCase;
  late MockLoginRepository mockLoginRepository;

  const testPin = "1234";

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    validatePinUseCase = ValidatePinUseCase(mockLoginRepository);
  });

  test('GIVEN a valid PIN '
      'WHEN calling the use case '
      'THEN it should return true', () async {
    when(mockLoginRepository.validatePin(pin: anyNamed('pin')))
        .thenAnswer((_) async => const Right(true));

    final result = await validatePinUseCase(testPin);

    expect(result, const Right<Failure, bool>(true));
    verify(mockLoginRepository.validatePin(pin: testPin)).called(1);
    verifyNoMoreInteractions(mockLoginRepository);
  });

  test('GIVEN an invalid PIN '
      'WHEN calling the use case '
      'THEN it should return false', () async {
    when(mockLoginRepository.validatePin(pin: anyNamed('pin')))
        .thenAnswer((_) async => const Right(false));

    final result = await validatePinUseCase(testPin);

    expect(result, const Right<Failure, bool>(false));
    verify(mockLoginRepository.validatePin(pin: testPin)).called(1);
    verifyNoMoreInteractions(mockLoginRepository);
  });

}
