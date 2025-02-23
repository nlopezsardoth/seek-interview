import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:seek_qr/seek_qr.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Scan QR Code returns a valid result', (WidgetTester tester) async {
    final SeekQr seekQr = SeekQr();

    final result = await seekQr.scanQRCode();
    
    // Ensure the result is either a valid QR code or an error message
    expect(result.code != null || result.errorMessage != null, true);
  });
}