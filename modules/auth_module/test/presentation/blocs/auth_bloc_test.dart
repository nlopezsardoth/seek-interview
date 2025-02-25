import 'package:auth_module/domain/entities/user.dart';
import 'package:auth_module/domain/usecases/use_cases.dart';
import 'package:auth_module/presentation/blocs/auth/auth_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_module/errors/failures.dart';

import '../../domain/mocks/use_cases_mock_helper.mocks.dart';

@GenerateMocks([LogInUseCase])
void main() {
  late AuthBloc authBloc;
  late MockLogInUseCase mockLogInUseCase;

  setUp(() {
    mockLogInUseCase = MockLogInUseCase();
    authBloc = AuthBloc(loginUser: mockLogInUseCase);
  });

  tearDown(() {
    authBloc.close();
  });

  group('AuthBloc', () {
    const testUser = User.empty;

    blocTest<AuthBloc, AuthState>(
      'GIVEN a successful login WHEN LogInRequested event is added THEN emits [authenticated]',
      build: () {
        when(mockLogInUseCase.call(any))
            .thenAnswer((_) async => const Right(true));
        return authBloc;
      },
      act: (bloc) => bloc.add(LogInRequested(testUser)),
      expect: () => [
        const AuthState.authenticated(testUser),
      ],
      verify: (_) {
        verify(mockLogInUseCase.call(testUser)).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'GIVEN a failed login WHEN LogInRequested event is added THEN emits [unauthenticated] and shows error',
      build: () {
        when(mockLogInUseCase.call(any))
            .thenAnswer((_) async => Left(LocalFailure(message: 'Error')));
        return authBloc;
      },
      act: (bloc) => bloc.add(LogInRequested(testUser)),
      expect: () => [
        const AuthState.unauthenticated(null),
      ],
      verify: (_) {
        verify(mockLogInUseCase.call(testUser)).called(1);
      },
    );
  });
}
