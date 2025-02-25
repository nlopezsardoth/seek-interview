import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_module/domain/use_cases/clear_qr_history_use_case.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_module/entities/no_parameters.dart';
import 'package:shared_module/errors/failures.dart';

import '../../data/mocks/repositories_mock_helper.mocks.dart';

void main() {
  late ClearQrHistoryUseCase clearQrHistoryUseCase;
  final mockQrHistoryRepository = MockQrHistoryRepository();

  setUpAll(() {
    clearQrHistoryUseCase = ClearQrHistoryUseCase(mockQrHistoryRepository);
  });

  test('GIVEN a valid request WHEN clearing history THEN it should complete successfully', () async {
    when(mockQrHistoryRepository.clearQrHistory()).thenAnswer((_) async => Right(null));

    final result = await clearQrHistoryUseCase(NoParams());

    expect(result, isA<Right<Failure, NoParams>>());
    verify(mockQrHistoryRepository.clearQrHistory()).called(1);
    verifyNoMoreInteractions(mockQrHistoryRepository);
  });
}
