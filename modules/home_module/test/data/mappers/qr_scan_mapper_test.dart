import 'package:flutter_test/flutter_test.dart';
import 'package:home_module/data/mappers/qr_scan_result_mapper.dart';

import 'package:home_module/domain/entities/qr_scann_entity.dart';
import 'package:seek_qr/pigeons/qr_scanner.g.dart';

void main() {
  group('QrScanMapper', () {
    final testModel = QRScanResult(
      code: 'https://example.com'
    );

    final testEntity = QrScan(
      data: 'https://example.com',
      scannedAt: DateTime(2025, 02, 23),
    );

    final testModelList = [testModel, QRScanResult(code: 'https://another.com')];
    final testEntityList = [testEntity, testEntity.copyWith(data: 'https://another.com')];

    test('should convert QrScanResult model to QrScan entity correctly', () {
      final result = QrScanMapper.fromModel(testModel);

      expect(result, isA<QrScan>());
      expect(result.data, testEntity.data);
    });

    test('should convert QrScan entity to QrScanResult model correctly', () {
      final result = QrScanMapper.toModel(testEntity);

      expect(result, isA<QRScanResult>());
      expect(result.code, testModel.code);
    });

    test('should convert List<QrScanResult> to List<QrScan> correctly', () {
      final result = QrScanMapper.fromModelList(testModelList);

      expect(result, isA<List<QrScan>>());
      expect(result.length, testModelList.length);
      expect(result[0].data, testModelList[0].code);
      expect(result[1].data, testModelList[1].code);
    });

    test('should convert List<QrScan> to List<QrScanResult> correctly', () {
      final result = QrScanMapper.toModelList(testEntityList);

      expect(result, isA<List<QRScanResult>>());
      expect(result.length, testEntityList.length);
      expect(result[0].code, testEntityList[0].data);
      expect(result[1].code, testEntityList[1].data);
    });
  });
}
