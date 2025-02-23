import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:seek_biometrics/pigeons/pigeon.g.dart';
import 'package:seek_biometrics/seek_biometrics.dart';
import 'package:seek_biometrics/seek_biometrics_platform_interface.dart';

import 'mock_helper.mocks.dart';


void main() {
  late SeekBiometrics seekBiometrics;
  late MockSeekBiometricsPlatform mockPlatform;
  setUp(() {
    mockPlatform = MockSeekBiometricsPlatform();
    SeekBiometricsPlatform.instance = mockPlatform;
    seekBiometrics = SeekBiometrics();

    // Default stubs
    when(mockPlatform.isDeviceSupported()).thenAnswer((_) async => true);
    when(mockPlatform.deviceSupportsBiometrics()).thenAnswer((_) async => true);
  });
  

  test('isDeviceSupported should return true', () async {
  when(mockPlatform.isDeviceSupported()).thenAnswer((_) async => true);
  final result = await SeekBiometrics().isDeviceSupported();

  expect(result, true);
  verify(mockPlatform.isDeviceSupported()).called(1); //
  });

  test('deviceSupportsBiometrics should return true', () async {
    when(mockPlatform.deviceSupportsBiometrics()).thenAnswer((_) async => true);

    final result = await seekBiometrics.deviceSupportsBiometrics();
    expect(result, true);
  });

  test('authenticate should return AuthResultDetails with success', () async {
    when(mockPlatform.authenticate(title: "Title", subtitle: "Subtitle")).thenAnswer(
      (_) async => AuthResultDetails(result: AuthResult.success, errorMessage: null),
    );

    final result = await seekBiometrics.authenticate(title: "Title", subtitle: "Subtitle");
    expect(result.result, AuthResult.success);
  });

  test('getEnrolledBiometrics should return enrolled biometrics list', () async {
    when(mockPlatform.getEnrolledBiometrics()).thenAnswer(
      (_) async => [AuthClassification.face, AuthClassification.fingerprint],
    );

    final result = await seekBiometrics.getEnrolledBiometrics();
    expect(result, contains(AuthClassification.face));
    expect(result, contains(AuthClassification.fingerprint));
  });

  test('authenticate should return an error if authentication fails', () async {
    when(mockPlatform.authenticate(title: "Title", subtitle: "Subtitle")).thenAnswer(
      (_) async => AuthResultDetails(result: AuthResult.error, errorMessage: "Authentication failed"),
    );

    final result = await seekBiometrics.authenticate(title: "Title", subtitle: "Subtitle");
    expect(result.result, AuthResult.error);
    expect(result.errorMessage, "Authentication failed");
  });
}
