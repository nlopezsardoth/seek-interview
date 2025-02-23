import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:seek_biometrics/pigeons/pigeon.g.dart';
import 'package:seek_biometrics/seek_biometrics_method_channel.dart';
import 'mock_helper.mocks.dart';

void main() {
  late MethodChannelSeekBiometrics seekBiometrics;
  late MockSeekAuthApi mockApi;

  setUp(() {
    mockApi = MockSeekAuthApi();
    seekBiometrics = MethodChannelSeekBiometrics(seekApi: mockApi);
  });

  test('isDeviceSupported should return true', () async {
    when(mockApi.isDeviceSupported()).thenAnswer((_) async => true);
    final result = await seekBiometrics.isDeviceSupported();

    expect(result, true);
  });

  test('deviceSupportsBiometrics should return true', () async {
    when(mockApi.deviceCanSupportBiometrics()).thenAnswer((_) async => true);

    final result = await seekBiometrics.deviceSupportsBiometrics();
    expect(result, true);
  });

  test('authenticate should return AuthResultDetails with success', () async {
    when(mockApi.authenticate("Title", "Subtitle")).thenAnswer(
      (_) async =>
          AuthResultDetails(result: AuthResult.success, errorMessage: null),
    );

    final result = await seekBiometrics.authenticate(
      title: "Title",
      subtitle: "Subtitle",
    );
    expect(result.result, AuthResult.success);
  });

  test('getEnrolledBiometrics should return biometric list', () async {
    when(mockApi.getEnrolledBiometrics()).thenAnswer(
      (_) async => [AuthClassification.face, AuthClassification.fingerprint],
    );

    final result = await seekBiometrics.getEnrolledBiometrics();
    expect(result, contains(AuthClassification.face));
    expect(result, contains(AuthClassification.fingerprint));
  });

  test('authenticate should return an error if authentication fails', () async {
    when(mockApi.authenticate("Title", "Subtitle")).thenAnswer(
      (_) async => AuthResultDetails(
        result: AuthResult.error,
        errorMessage: "Authentication failed",
      ),
    );

    final result = await seekBiometrics.authenticate(
      title: "Title",
      subtitle: "Subtitle",
    );
    expect(result.result, AuthResult.error);
    expect(result.errorMessage, "Authentication failed");
  });
}
