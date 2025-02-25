import 'package:flutter_test/flutter_test.dart';
import 'package:home_module/data/datasources/seek_qr_datasource_impl.dart';
import 'package:mockito/mockito.dart';

import 'package:seek_qr/pigeons/qr_scanner.g.dart';

import '../mocks/datasources_mock_helper.mocks.dart';

void main() {
  late SeekQrDatasourceImpl dataSource;
  late MockSeekQr mockSeekQr;

  setUp(() {
    mockSeekQr = MockSeekQr();
    dataSource = SeekQrDatasourceImpl(seekQr: mockSeekQr);
  });

  group('scanQrCode', () {
    test(
      'GIVEN a valid QR scan WHEN calling scanQrCode THEN it should return QrScanResult',
      () async {
        final testResult = QRScanResult(code: 'https://example.com');

        when(mockSeekQr.scanQRCode()).thenAnswer((_) async => testResult);

        final result = await dataSource.scanQRCode();

        expect(result, isA<QRScanResult>());
        expect(result.code, 'https://example.com');

        verify(mockSeekQr.scanQRCode()).called(1);
        verifyNoMoreInteractions(mockSeekQr);
      },
    );

    test(
      'GIVEN an error WHEN calling scanQrCode THEN it should throw an exception',
      () async {
        when(mockSeekQr.scanQRCode()).thenThrow(Exception('QR scan error'));

        expect(() async => await dataSource.scanQRCode(), throwsException);

        verify(mockSeekQr.scanQRCode()).called(1);
        verifyNoMoreInteractions(mockSeekQr);
      },
    );
  });
}
