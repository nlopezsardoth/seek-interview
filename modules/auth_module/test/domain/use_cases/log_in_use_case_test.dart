import 'package:auth_module/domain/entities/user.dart';
import 'package:auth_module/domain/usecases/log_in_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_module/errors/failures.dart';

import '../../data/mocks/repositories_mock_helper.mocks.dart';

void main() {
  late LogInUseCase logInUseCase;
  late MockLoginRepository mockLoginRepository;

  final testUser = User(
    id: '12345',
    pin: '1234',
    isBiometricConfigured: true,
  );

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    logInUseCase = LogInUseCase(mockLoginRepository);
  });

  test('GIVEN valid user credentials '
      'WHEN calling the use case '
      'THEN it should return true', () async {
    when(mockLoginRepository.logInUser(any))
        .thenAnswer((_) async => const Right(true));

    final result = await logInUseCase(testUser);

    expect(result, const Right<Failure, bool>(true));
    verify(mockLoginRepository.logInUser(testUser)).called(1);
    verifyNoMoreInteractions(mockLoginRepository);
  });

  test('GIVEN invalid user credentials '
      'WHEN calling the use case '
      'THEN it should return false', () async {
    when(mockLoginRepository.logInUser(any))
        .thenAnswer((_) async => const Right(false));

    final result = await logInUseCase(testUser);

    expect(result, const Right<Failure, bool>(false));
    verify(mockLoginRepository.logInUser(testUser)).called(1);
    verifyNoMoreInteractions(mockLoginRepository);
  });

}
