import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_module/data/repositories/qr_scanner_repository_impl.dart';
import 'package:home_module/domain/entities/qr_scann_entity.dart';
import 'package:mockito/mockito.dart';
import 'package:seek_qr/pigeons/qr_scanner.g.dart';
import 'package:shared_module/errors/exceptions.dart';
import 'package:shared_module/errors/failures.dart';

import '../mocks/datasources_mock_helper.mocks.dart';

void main() {
  late QrScannerRepositoryImpl repository;
  late MockSeekQrDatasource mockScannerDatasource;

  setUp(() {
    mockScannerDatasource = MockSeekQrDatasource();
    repository = QrScannerRepositoryImpl(
      scannerDatasource: mockScannerDatasource,
    );
  });

  group('scanQrCode', () {
    final testQrScan = QrScan(
      data: 'https://example.com',
      scannedAt: DateTime.now(),
    );
    final testSeekQrResponse = QRScanResult(code: 'https://example.com');

    test(
      'GIVEN a successful scan WHEN calling scanQrCode THEN should return QrScan entity',
      () async {
        when(
          mockScannerDatasource.scanQRCode(),
        ).thenAnswer((_) async => testSeekQrResponse);

        final result = await repository.scanQrCode();

        expect(result, equals(Right<Failure, QrScan>(testQrScan)));
        verify(mockScannerDatasource.scanQRCode()).called(1);
        verifyNoMoreInteractions(mockScannerDatasource);
      },
    );

    test(
      'GIVEN a scanner error WHEN calling scanQrCode THEN should return LocalFailure',
      () async {
        when(
          mockScannerDatasource.scanQRCode(),
        ).thenThrow(QrScanException(message: 'Scanner error'));

        final result = await repository.scanQrCode();

        expect(
          result,
          isA<Left<Failure, QrScan>>().having(
            (left) => left.value.message,
            'message',
            'Scanner error',
          ),
        );

        verify(mockScannerDatasource.scanQRCode()).called(1);
        verifyNoMoreInteractions(mockScannerDatasource);
      },
    );
  });
}
