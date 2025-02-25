import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_module/domain/entities/qr_scann_entity.dart';
import 'package:home_module/presentation/blocs/qr/qr_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_module/entities/no_parameters.dart';
import 'package:shared_module/errors/failures.dart';

import '../../domain/mocks/use_cases_mock_helper.mocks.dart';

void main() {
  late MockScanQrUseCase mockScanQrUseCase;
  late MockGetQrHistoryUseCase mockGetQrHistoryUseCase;
  late MockSaveQrHistoryUseCase mockSaveQrHistoryUseCase;
  late MockClearQrHistoryUseCase mockClearQrHistoryUseCase;
  late QrBloc qrBloc;

  final testQrScan = QrScan(data: "https://example.com", scannedAt: DateTime(2025, 2, 23));

  setUp(() {
    mockScanQrUseCase = MockScanQrUseCase();
    mockGetQrHistoryUseCase = MockGetQrHistoryUseCase();
    mockSaveQrHistoryUseCase = MockSaveQrHistoryUseCase();
    mockClearQrHistoryUseCase = MockClearQrHistoryUseCase();

    qrBloc = QrBloc(
      scanQrUseCase: mockScanQrUseCase,
      getQrHistoryUseCase: mockGetQrHistoryUseCase,
      saveQrHistoryUseCase: mockSaveQrHistoryUseCase,
      clearQrHistoryUseCase: mockClearQrHistoryUseCase,
    );
  });

  tearDown(() {
    qrBloc.close();
  });


  test('Initial state should be QrState with empty history', () {
    expect(qrBloc.state, const QrState());
  });

  blocTest<QrBloc, QrState>(
    'GIVEN a successful scan WHEN calling scanQr THEN it should return a QrScan entity',
    build: () {
      when(mockScanQrUseCase(NoParams()))
        .thenAnswer((_) async => Right(testQrScan));
    when(mockSaveQrHistoryUseCase(testQrScan))
        .thenAnswer((_) async => Right(NoParams()));
    return qrBloc;
    },
    act: (bloc) => bloc.add(ScanQrCode()),
    expect: () => [
       QrState(qrScan: testQrScan, history: const []),
    ],
    verify: (_) {
      verify(mockScanQrUseCase(NoParams())).called(1); 
      verify(mockSaveQrHistoryUseCase(testQrScan)).called(1);
    },
  );

  blocTest<QrBloc, QrState>(
    'GIVEN a scan failure WHEN calling scanQr THEN it should return an error state',
    build: () {
      when(mockScanQrUseCase(null))
          .thenAnswer((_) async => Left(QrFailure(message: 'Scan Error')));
      return qrBloc;
    },
    act: (bloc) async => bloc.add(ScanQrCode()),
    expect: () => [
      const QrState(errorMessage: 'Scan Error'),
    ],
    verify: (_) {
      verify(mockScanQrUseCase(null)).called(1);
    },
  );

  blocTest<QrBloc, QrState>(
    'GIVEN saved history WHEN calling getQrHistory THEN it should return the list of scanned QRs',
    build: () {
      when(mockGetQrHistoryUseCase(null))
          .thenAnswer((_) async => Right([testQrScan]));
      return qrBloc;
    },
    act: (bloc) => bloc.add(LoadQrHistory()),
    expect: () => [
      QrState(history: [testQrScan]),
    ],
    verify: (_) {
      verify(mockGetQrHistoryUseCase(null)).called(1);
    },
  );

  blocTest<QrBloc, QrState>(
    'GIVEN cleared history WHEN calling clearQrHistory THEN it should return an empty history',
    build: () {
      when(mockClearQrHistoryUseCase(null)).thenAnswer((_) async => Right(NoParams()));
      return qrBloc;
    },
    act: (bloc) => bloc.add(ClearQrHistory()),
    expect: () => [
      const QrState(history: []),
    ],
    verify: (_) {
      verify(mockClearQrHistoryUseCase(null)).called(1);
    },
  );
}
