import 'package:auth_module/domain/usecases/set_new_pin_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_module/errors/failures.dart';

import '../../data/mocks/repositories_mock_helper.mocks.dart';

void main() {
  late SetNewPinUseCase setNewPinUseCase;
  late MockLoginRepository mockLoginRepository;

  const testPin = "1234";

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    setNewPinUseCase = SetNewPinUseCase(mockLoginRepository);
  });

  test('GIVEN a valid new PIN '
      'WHEN calling the use case '
      'THEN it should return true', () async {
    when(mockLoginRepository.setNewPin(newPin: anyNamed('newPin')))
        .thenAnswer((_) async => const Right(true));

    final result = await setNewPinUseCase(testPin);

    expect(result, const Right<Failure, bool>(true));
    verify(mockLoginRepository.setNewPin(newPin: testPin)).called(1);
    verifyNoMoreInteractions(mockLoginRepository);
  });

  test('GIVEN an invalid new PIN '
      'WHEN calling the use case '
      'THEN it should return false', () async {
    when(mockLoginRepository.setNewPin(newPin: anyNamed('newPin')))
        .thenAnswer((_) async => const Right(false));

    final result = await setNewPinUseCase(testPin);

    expect(result, const Right<Failure, bool>(false));
    verify(mockLoginRepository.setNewPin(newPin: testPin)).called(1);
    verifyNoMoreInteractions(mockLoginRepository);
  });
}
