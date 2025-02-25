import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_module/domain/entities/qr_scann_entity.dart';
import 'package:home_module/domain/use_cases/save_qr_history_use_case.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_module/entities/no_parameters.dart';
import 'package:shared_module/errors/failures.dart';

import '../../data/mocks/repositories_mock_helper.mocks.dart';

void main() {
  late SaveQrHistoryUseCase saveQrHistoryUseCase;
  final mockQrHistoryRepository = MockQrHistoryRepository();
  final testQrScan = QrScan(data: 'https://example.com', scannedAt: DateTime.now());

  setUpAll(() {
    saveQrHistoryUseCase = SaveQrHistoryUseCase(mockQrHistoryRepository);
  });

  test('GIVEN a valid QR scan WHEN saving it THEN it should complete successfully', () async {
    when(mockQrHistoryRepository.saveQrScan(testQrScan)).thenAnswer((_) async => Right(null));

    final result = await saveQrHistoryUseCase(testQrScan);

     expect(result, isA<Right<Failure, NoParams>>());
    verify(mockQrHistoryRepository.saveQrScan(testQrScan)).called(1);
    verifyNoMoreInteractions(mockQrHistoryRepository);
  });
}
