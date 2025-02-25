import 'package:auth_module/domain/entities/user.dart';
import 'package:auth_module/domain/usecases/get_user_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_module/errors/failures.dart';

import '../../data/mocks/repositories_mock_helper.mocks.dart';

void main() {
  late GetUserUseCase getUserUseCase;
  late MockLoginRepository mockLoginRepository;

  final testUser = User(
    id: '12345',
    pin: '1234',
    isBiometricConfigured: false
  );

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    getUserUseCase = GetUserUseCase(mockLoginRepository);
  });

  test('GIVEN a stored user exists '
      'WHEN calling the use case '
      'THEN it should return the user', () async {
    when(mockLoginRepository.getUser()).thenAnswer((_) async => Right(testUser));

    final result = await getUserUseCase(null);

    expect(result, Right<Failure, User?>(testUser));
    verify(mockLoginRepository.getUser()).called(1);
    verifyNoMoreInteractions(mockLoginRepository);
  });

  test('GIVEN no stored user exists '
      'WHEN calling the use case '
      'THEN it should return null', () async {
    when(mockLoginRepository.getUser()).thenAnswer((_) async => const Right(null));

    final result = await getUserUseCase(null);

    expect(result, const Right<Failure, User?>(null));
    verify(mockLoginRepository.getUser()).called(1);
    verifyNoMoreInteractions(mockLoginRepository);
  });


}
