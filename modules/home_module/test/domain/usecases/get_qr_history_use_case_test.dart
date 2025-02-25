import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_module/domain/entities/qr_scann_entity.dart';
import 'package:home_module/domain/use_cases/get_qr_history_use_case.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_module/entities/no_parameters.dart';

import '../../data/mocks/repositories_mock_helper.mocks.dart';

void main() {
  late GetQrHistoryUseCase getQrHistoryUseCase;
  final mockQrHistoryRepository = MockQrHistoryRepository();
  final testQrScans = [
    QrScan(data: 'https://example1.com', scannedAt: DateTime.now()),
    QrScan(data: 'https://example2.com', scannedAt: DateTime.now())
  ];

  setUpAll(() {
    getQrHistoryUseCase = GetQrHistoryUseCase(mockQrHistoryRepository);
  });

  test('GIVEN a valid history WHEN fetching history THEN it should return a list of QrScans', () async {
    when(mockQrHistoryRepository.getQrScanHistory()).thenAnswer((_) async => Right(testQrScans));

    final result = await getQrHistoryUseCase(NoParams());

    expect(result, Right(testQrScans));
    verify(mockQrHistoryRepository.getQrScanHistory()).called(1);
    verifyNoMoreInteractions(mockQrHistoryRepository);
  });
}
