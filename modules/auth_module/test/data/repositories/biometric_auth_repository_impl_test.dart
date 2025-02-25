import 'package:auth_module/data/repositories/biometric_auth_repository_impl.dart';
import 'package:auth_module/domain/entities/biometric_auth_parameters.dart';
import 'package:auth_module/domain/entities/biometric_auth_response.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:seek_biometrics/pigeons/pigeon.g.dart';
import 'package:shared_module/errors/exceptions.dart';
import 'package:shared_module/errors/failures.dart';

import '../mocks/datasources_mock_helper.mocks.dart';

void main() {
  late BiometricAuthRepositoryImpl repository;
  late MockSeekBiometricsDatasource mockBiometricDataSource;

  setUp(() {
    mockBiometricDataSource = MockSeekBiometricsDatasource();
    repository = BiometricAuthRepositoryImpl(
      biometricDataSource: mockBiometricDataSource,
    );
  });

  group('biometricAuth', () {
    const params = BiometricAuthParams(
      title: 'Authenticate to access',
      subtitle: 'Authenticate to access',
    );

    test(
      'GIVEN valid authentication WHEN calling biometricAuth THEN should return success result',
      () async {
        when(
          mockBiometricDataSource.authenticate(
            title: anyNamed('title'),
            subtitle: anyNamed('subtitle'),
          ),
        ).thenAnswer(
          (_) async => AuthResultDetails(result: AuthResult.success),
        );

        final result = await repository.biometricAuth(params: params);

        expect(result, Right<Failure, BioAuthResult>(BioAuthResult.success));
        verify(
          mockBiometricDataSource.authenticate(
            title: params.title,
            subtitle: params.subtitle,
          ),
        ).called(1);
        verifyNoMoreInteractions(mockBiometricDataSource);
      },
    );

    test(
      'GIVEN failed authentication WHEN calling biometricAuth THEN should return failure result',
      () async {
        when(
          mockBiometricDataSource.authenticate(
            title: anyNamed('title'),
            subtitle: anyNamed('subtitle'),
          ),
        ).thenAnswer(
          (_) async => AuthResultDetails(result: AuthResult.failure),
        );

        final result = await repository.biometricAuth(params: params);

        expect(result, Right<Failure, BioAuthResult>(BioAuthResult.failure));
        verify(
          mockBiometricDataSource.authenticate(
            title: params.title,
            subtitle: params.subtitle,
          ),
        ).called(1);
        verifyNoMoreInteractions(mockBiometricDataSource);
      },
    );

    test(
      'GIVEN biometric exception WHEN calling biometricAuth THEN should return LocalFailure',
      () async {
        when(
          mockBiometricDataSource.authenticate(
            title: anyNamed('title'),
            subtitle: anyNamed('subtitle'),
          ),
        ).thenThrow(BiometricAuthException(message: 'Biometric error'));

        final result = await repository.biometricAuth(params: params);

        expect(
          result.fold((failure) => failure.message, (r) => null),
          'Biometric error',
        ); // Validate message
        verify(
          mockBiometricDataSource.authenticate(
            title: params.title,
            subtitle: params.subtitle,
          ),
        ).called(1);
        verifyNoMoreInteractions(mockBiometricDataSource);
      },
    );
  });

  group('biometricCanAuth', () {
    test(
      'GIVEN supported and enrolled biometrics WHEN calling biometricCanAuth THEN should return true',
      () async {
        when(
          mockBiometricDataSource.deviceSupportsBiometrics(),
        ).thenAnswer((_) async => true);
        when(
          mockBiometricDataSource.getEnrolledBiometrics(),
        ).thenAnswer((_) async => [AuthClassification.fingerprint]);

        final result = await repository.biometricCanAuth();

        expect(result, const Right<Failure, bool>(true));
        verify(mockBiometricDataSource.deviceSupportsBiometrics()).called(1);
        verify(mockBiometricDataSource.getEnrolledBiometrics()).called(1);
        verifyNoMoreInteractions(mockBiometricDataSource);
      },
    );

    test(
      'GIVEN no enrolled biometrics WHEN calling biometricCanAuth THEN should return false',
      () async {
        when(
          mockBiometricDataSource.deviceSupportsBiometrics(),
        ).thenAnswer((_) async => true);
        when(
          mockBiometricDataSource.getEnrolledBiometrics(),
        ).thenAnswer((_) async => []);

        final result = await repository.biometricCanAuth();

        expect(result, const Right<Failure, bool>(false));
        verify(mockBiometricDataSource.deviceSupportsBiometrics()).called(1);
        verify(mockBiometricDataSource.getEnrolledBiometrics()).called(1);
        verifyNoMoreInteractions(mockBiometricDataSource);
      },
    );

    test(
      'GIVEN unsupported device WHEN calling biometricCanAuth THEN should return false',
      () async {
        when(
          mockBiometricDataSource.deviceSupportsBiometrics(),
        ).thenAnswer((_) async => false);

        final result = await repository.biometricCanAuth();

        expect(result, const Right<Failure, bool>(false));
        verify(mockBiometricDataSource.deviceSupportsBiometrics()).called(1);
        verifyNoMoreInteractions(mockBiometricDataSource);
      },
    );

    test(
      'GIVEN biometric exception WHEN calling biometricCanAuth THEN should return LocalFailure',
      () async {
        when(
          mockBiometricDataSource.deviceSupportsBiometrics(),
        ).thenThrow(BiometricAuthException(message: 'Biometric error'));

        final result = await repository.biometricCanAuth();

        expect(
          result,
          isA<Left<Failure, bool>>(),
        ); // Checks it's a Left<Failure, bool>
        expect(
          result.fold((failure) => failure.message, (r) => null),
          'Biometric error',
        ); // Validate message
        verify(mockBiometricDataSource.deviceSupportsBiometrics()).called(1);
        verifyNoMoreInteractions(mockBiometricDataSource);
      },
    );
  });
}
