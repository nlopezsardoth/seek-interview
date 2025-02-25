import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_module/domain/entities/qr_scann_entity.dart';
import 'package:home_module/domain/use_cases/scan_qr_use_case.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_module/entities/no_parameters.dart';

import '../../data/mocks/repositories_mock_helper.mocks.dart';


void main() {
  late ScanQrUseCase scanQrCodeUseCase;
  final mockQrRepository = MockQrScannerRepository();

  setUpAll(() {
    scanQrCodeUseCase = ScanQrUseCase(mockQrRepository);
  });

  final qrScan = QrScan(data: 'https://example.com', scannedAt: DateTime.now());

  test('GIVEN a valid QR code scan '
      'WHEN calling the use case '
      'THEN it should return a QrScan entity', () async {
    when(mockQrRepository.scanQrCode()).thenAnswer(
      (_) async => Right(qrScan),
    );

    final result = await scanQrCodeUseCase(NoParams());

    expect(result, Right(qrScan));
    verify(mockQrRepository.scanQrCode()).called(1);
    verifyNoMoreInteractions(mockQrRepository);
  });
}
