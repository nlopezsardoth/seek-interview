import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:seek_biometrics/pigeons/pigeon.g.dart';
import 'package:seek_biometrics/seek_biometrics.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final seekBiometrics = SeekBiometrics();

  testWidgets('Check if device supports biometrics', (WidgetTester tester) async {
    final isSupported = await seekBiometrics.isDeviceSupported();
    expect(isSupported, true);
  });

  testWidgets('Check enrolled biometrics', (WidgetTester tester) async {
    final enrolledBiometrics = await seekBiometrics.getEnrolledBiometrics();
    expect(enrolledBiometrics.isNotEmpty, true);
  });

  testWidgets('Authenticate with biometrics', (WidgetTester tester) async {
    final authResult = await seekBiometrics.authenticate(title: "Test Auth", subtitle: "Testing biometric auth");
    expect(authResult.result, equals(AuthResult.success));
  });
}
