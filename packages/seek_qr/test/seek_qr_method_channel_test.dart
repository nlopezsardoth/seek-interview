import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:seek_qr/pigeons/qr_scanner.g.dart';
import 'package:seek_qr/seek_qr_method_channel.dart';

import 'mock_helper.mocks.dart';

void main() {
  late MethodChannelSeekQr seekQr;
  late MockQRScannerApi mockApi;

  setUp(() {
    mockApi = MockQRScannerApi();
    seekQr = MethodChannelSeekQr(qrApi: mockApi);
  });


  test('scanQRCode calls native method and returns expected data', () async {
    final mockResult = QRScanResult(code: "mock_code", errorMessage: null);
    when(seekQr.scanQRCode()).thenAnswer((_) async => mockResult);

    final result = await seekQr.scanQRCode();

    expect(result.code, "mock_code");
    expect(result.errorMessage, isNull);
    verify(seekQr.scanQRCode()).called(1);
  });

  test('scanQRCode handles an error case', () async {
    final mockResult = QRScanResult(code: null, errorMessage: "Error occurred");
    when(seekQr.scanQRCode()).thenAnswer((_) async => mockResult);

    final result = await seekQr.scanQRCode();

    expect(result.code, isNull);
    expect(result.errorMessage, "Error occurred");
    verify(seekQr.scanQRCode()).called(1);
  });
}
