import 'package:auth_module/data/datasources/seek_biometrics_datasource_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seek_biometrics/pigeons/pigeon.g.dart';

import 'package:shared_module/errors/exceptions.dart';

import '../mocks/datasources_mock_helper.mocks.dart';

void main() {
  late SeekBiometricsDatasourceImpl datasource;
  late MockSeekBiometrics mockSeekBiometrics;

  setUp(() {
    mockSeekBiometrics = MockSeekBiometrics();
    datasource = SeekBiometricsDatasourceImpl(seekBiometrics: mockSeekBiometrics);
  });

  group('authenticate', () {
    test(
      'GIVEN valid authentication WHEN calling authenticate THEN should return AuthResultDetails',
      () async {
        when(mockSeekBiometrics.authenticate(title: anyNamed('title'), subtitle: anyNamed('subtitle')))
            .thenAnswer((_) async => AuthResultDetails(result: AuthResult.success));

        final result = await datasource.authenticate(title: 'Test', subtitle: 'Test');

        expect(result, isA<AuthResultDetails>());
        expect(result.result, AuthResult.success);
        verify(mockSeekBiometrics.authenticate(title: 'Test', subtitle: 'Test')).called(1);
        verifyNoMoreInteractions(mockSeekBiometrics);
      },
    );

    test(
      'GIVEN an error WHEN calling authenticate THEN should throw BiometricAuthException',
      () async {
        when(mockSeekBiometrics.authenticate(title: anyNamed('title'), subtitle: anyNamed('subtitle')))
            .thenThrow(Exception('Biometric error'));

        expect(
          () async => await datasource.authenticate(title: 'Test', subtitle: 'Test'),
          throwsA(isA<BiometricAuthException>()),
        );
        verify(mockSeekBiometrics.authenticate(title: 'Test', subtitle: 'Test')).called(1);
        verifyNoMoreInteractions(mockSeekBiometrics);
      },
    );
  });

  group('getEnrolledBiometrics', () {
    test(
      'GIVEN enrolled biometrics WHEN calling getEnrolledBiometrics THEN should return a list of AuthClassification',
      () async {
        when(mockSeekBiometrics.getEnrolledBiometrics())
            .thenAnswer((_) async => [AuthClassification.fingerprint]);

        final result = await datasource.getEnrolledBiometrics();

        expect(result, [AuthClassification.fingerprint]);
        verify(mockSeekBiometrics.getEnrolledBiometrics()).called(1);
        verifyNoMoreInteractions(mockSeekBiometrics);
      },
    );

    test(
      'GIVEN an error WHEN calling getEnrolledBiometrics THEN should throw BiometricAuthException',
      () async {
        when(mockSeekBiometrics.getEnrolledBiometrics()).thenThrow(Exception('Biometric error'));

        expect(
          () async => await datasource.getEnrolledBiometrics(),
          throwsA(isA<BiometricAuthException>()),
        );
        verify(mockSeekBiometrics.getEnrolledBiometrics()).called(1);
        verifyNoMoreInteractions(mockSeekBiometrics);
      },
    );
  });

  group('deviceSupportsBiometrics', () {
    test(
      'GIVEN supported device WHEN calling deviceSupportsBiometrics THEN should return true',
      () async {
        when(mockSeekBiometrics.deviceSupportsBiometrics()).thenAnswer((_) async => true);

        final result = await datasource.deviceSupportsBiometrics();

        expect(result, true);
        verify(mockSeekBiometrics.deviceSupportsBiometrics()).called(1);
        verifyNoMoreInteractions(mockSeekBiometrics);
      },
    );

    test(
      'GIVEN an error WHEN calling deviceSupportsBiometrics THEN should throw BiometricAuthException',
      () async {
        when(mockSeekBiometrics.deviceSupportsBiometrics()).thenThrow(Exception('Biometric error'));

        expect(
          () async => await datasource.deviceSupportsBiometrics(),
          throwsA(isA<BiometricAuthException>()),
        );
        verify(mockSeekBiometrics.deviceSupportsBiometrics()).called(1);
        verifyNoMoreInteractions(mockSeekBiometrics);
      },
    );
  });

  group('isDeviceSupported', () {
    test(
      'GIVEN supported device WHEN calling isDeviceSupported THEN should return true',
      () async {
        when(mockSeekBiometrics.isDeviceSupported()).thenAnswer((_) async => true);

        final result = await datasource.isDeviceSupported();

        expect(result, true);
        verify(mockSeekBiometrics.isDeviceSupported()).called(1);
        verifyNoMoreInteractions(mockSeekBiometrics);
      },
    );

    test(
      'GIVEN an error WHEN calling isDeviceSupported THEN should throw BiometricAuthException',
      () async {
        when(mockSeekBiometrics.isDeviceSupported()).thenThrow(Exception('Biometric error'));

        expect(
          () async => await datasource.isDeviceSupported(),
          throwsA(isA<BiometricAuthException>()),
        );
        verify(mockSeekBiometrics.isDeviceSupported()).called(1);
        verifyNoMoreInteractions(mockSeekBiometrics);
      },
    );
  });
}
