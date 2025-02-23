import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:seek_qr/pigeons/qr_scanner.g.dart';
import 'package:seek_qr/seek_qr.dart';
import 'package:seek_qr/seek_qr_platform_interface.dart';

import 'mock_helper.mocks.dart';

void main() {
  late SeekQr seekQR;
  late MockSeekQrPlatform mockPlatform;

  setUp(() {
    mockPlatform = MockSeekQrPlatform();
    SeekQrPlatform.instance = mockPlatform;
    seekQR = SeekQr();

    // Default stubs
    when(mockPlatform.scanQRCode()).thenAnswer(
      (_) async => QRScanResult(code: "mock_qr_code", errorMessage: null),
    );
  });

  test('scanQRCode should return a valid QRScanResult', () async {
    final mockResult = QRScanResult(code: "mock_qr_code", errorMessage: null);
    when(mockPlatform.scanQRCode()).thenAnswer((_) async => mockResult);

    final result = await seekQR.scanQRCode();

    expect(result.code, "mock_qr_code");
    expect(result.errorMessage, isNull);
  });

  test('scanQRCode should return an error', () async {
    final mockResult = QRScanResult(code: null, errorMessage: "Scan failed");
    when(mockPlatform.scanQRCode()).thenAnswer((_) async => mockResult);

    final result = await seekQR.scanQRCode();

    expect(result.code, isNull);
    expect(result.errorMessage, "Scan failed");
  });
}
