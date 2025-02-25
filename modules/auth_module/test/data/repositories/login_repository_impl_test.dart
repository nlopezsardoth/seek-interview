import 'package:auth_module/data/repositories/login_repository_impl.dart';
import 'package:auth_module/data/mappers/user_mapper.dart';
import 'package:auth_module/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_module/errors/exceptions.dart';
import 'package:shared_module/errors/failures.dart';

import '../mocks/datasources_mock_helper.mocks.dart';



void main() {
  late LoginRepositoryImpl repository;
  late MockSeekStorageDatasource mockLocalDatasource;

  setUp(() {
    mockLocalDatasource = MockSeekStorageDatasource();
    repository = LoginRepositoryImpl(localDatasource: mockLocalDatasource);
  });

  group('getUser', () {
    test(
      'GIVEN a stored user WHEN calling getUser THEN should return the user entity',
      () async {
        final userModel = UserMapper.toModel(User.empty);
        when(mockLocalDatasource.getUser()).thenAnswer((_) async => userModel);

        final result = await repository.getUser();

        expect(result, Right<Failure, User?>(UserMapper.fromModel(userModel)));
        verify(mockLocalDatasource.getUser()).called(1);
        verifyNoMoreInteractions(mockLocalDatasource);
      },
    );

    test(
      'GIVEN no stored user WHEN calling getUser THEN should return null',
      () async {
        when(mockLocalDatasource.getUser()).thenAnswer((_) async => null);

        final result = await repository.getUser();

        expect(result, const Right<Failure, User?>(null));
        verify(mockLocalDatasource.getUser()).called(1);
        verifyNoMoreInteractions(mockLocalDatasource);
      },
    );

    test(
      'GIVEN a database exception WHEN calling getUser THEN should return LocalFailure',
      () async {
        when(mockLocalDatasource.getUser()).thenThrow(LocalDatabaseException(message: 'Database error'));

        final result = await repository.getUser();

        expect(result.fold((failure) => failure.message, (r) => null), 'Database error');
        verify(mockLocalDatasource.getUser()).called(1);
        verifyNoMoreInteractions(mockLocalDatasource);
      },
    );
  });

  group('logInUser', () {
    final user = User.empty;

    test(
      'GIVEN a valid user WHEN calling logInUser THEN should return true',
      () async {
        when(mockLocalDatasource.putUser(recentUserLocal: anyNamed('recentUserLocal'))).thenAnswer((_) async => true);

        final result = await repository.logInUser(user);

        expect(result, const Right<Failure, bool>(true));
        verify(mockLocalDatasource.putUser(recentUserLocal: UserMapper.toModel(user))).called(1);
        verifyNoMoreInteractions(mockLocalDatasource);
      },
    );

    test(
      'GIVEN a database exception WHEN calling logInUser THEN should return LocalFailure',
      () async {
        when(mockLocalDatasource.putUser(recentUserLocal: anyNamed('recentUserLocal')))
            .thenThrow(LocalDatabaseException(message: 'Database error'));

        final result = await repository.logInUser(user);

        expect(result.fold((failure) => failure.message, (r) => null), 'Database error');
        verify(mockLocalDatasource.putUser(recentUserLocal: UserMapper.toModel(user))).called(1);
        verifyNoMoreInteractions(mockLocalDatasource);
      },
    );
  });

  group('setNewPin', () {
    test(
      'GIVEN a user exists WHEN calling setNewPin THEN should update pin and return true',
      () async {
        const newPin = '1234';
        final user = User.empty.copyWith(pin: newPin);

        when(mockLocalDatasource.getUser()).thenAnswer((_) async => UserMapper.toModel(user));
        when(mockLocalDatasource.putUser(recentUserLocal: anyNamed('recentUserLocal'))).thenAnswer((_) async => true);

        final result = await repository.setNewPin(newPin: newPin);

        expect(result, const Right<Failure, bool>(true));
        verify(mockLocalDatasource.getUser()).called(1);
        verify(mockLocalDatasource.putUser(recentUserLocal: UserMapper.toModel(user))).called(1);
        verifyNoMoreInteractions(mockLocalDatasource);
      },
    );
  });

  group('validatePin', () {
    test(
      'GIVEN correct pin WHEN calling validatePin THEN should return true',
      () async {
        const correctPin = '1234';
        final user = User.empty.copyWith(pin: correctPin);

        when(mockLocalDatasource.getUser()).thenAnswer((_) async => UserMapper.toModel(user));

        final result = await repository.validatePin(pin: correctPin);

        expect(result, const Right<Failure, bool>(true));
        verify(mockLocalDatasource.getUser()).called(1);
        verifyNoMoreInteractions(mockLocalDatasource);
      },
    );

    test(
      'GIVEN incorrect pin WHEN calling validatePin THEN should return false',
      () async {
        const enteredPin = '5678';
        final user = User.empty.copyWith(pin: '1234');

        when(mockLocalDatasource.getUser()).thenAnswer((_) async => UserMapper.toModel(user));

        final result = await repository.validatePin(pin: enteredPin);

        expect(result, const Right<Failure, bool>(false));
        verify(mockLocalDatasource.getUser()).called(1);
        verifyNoMoreInteractions(mockLocalDatasource);
      },
    );
  });
}
